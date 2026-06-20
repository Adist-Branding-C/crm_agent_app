feat(my_activity): match UI to design specs and fix file-length violations

- Extract ActivityStatusBadge into its own widget file (activity_status_badge.dart)
- Slim activity_title_row.dart from 83 → 31 lines
- Condense my_activity_handlers.dart from 85 → 70 lines
- Replace SelectionGroup with dark-fill horizontal chip row for type filters
- Remove 48px left indent on date headers to sit flush-left

All files now comply with the <80 lines constraint.
flutter analyze: no issues found.

feat : call report implimented


 Refactor: Eliminate part-file anti-patterns, extract UI strings, fix performance

- Removed all 15 Dart `part of` directives across 12 files → proper imports/exports
- Extracted UI error strings from 11 Bloc state classes → presentation-layer helpers
- Fixed duplicate `authRepo.init()` call in app.dart
- Extracted static data from call_report_screen.dart (was 91 lines) → separate model
- Narrowed DashboardScreen rebuild scope — isolated `context.watch` to tab body
- Made call_log_route_provider compatible with typed path-based routing
- No breaking API changes; 0 errors, 0 warnings after refactor

Clean up: Remove redundant imports, split bloated state, extract domain logic

- Removed 24 unnecessary re-imports from 14 widget/handler files
- Split add_lead_state.dart (115→70 lines) into add_lead_form_inputs.dart,
  add_lead_submission_status.dart, and add_lead_state.dart
- Extracted Lead.initials from domain model → LeadInitials presentation extension
- flutter analyze: 0 issues, all lib/ files under 80 lines

fix: sync My Activity lead filter with live leads data

Replace the `assignee`-derived lead list in `MyActivityBloc` with live
data from `LeadsRepository`, so the "Filter by Lead" dropdown reflects
current leads (including newly added or deleted ones) instead of stale
activity assignee names.

- Inject `LeadsRepository` into `MyActivityBloc`
- Fetch `leadNames` via `leadsRepository.getLeads()` in `onLoadMyActivity`
- Wire the new dependency in `my_activity_screen.dart`



fix: resolve all 12 architectural review issues

- Persist auth token via SharedPreferences (was in-memory, lost on restart)
- Split 5 files exceeding 80-line constraint (lead_filter_sheet, add_lead_event,
  attendance_state_loaded, app_providers, menu_list)
- Decouple CallLogHandlers from EnquiryActivity by moving model to data layer
- Cache allLeads in LeadsBloc instead of LeadsLoaded state (desync risk)
- Narrow BlocBuilder scope in AccountScreen (static header outside builder)
- Persist dashboard tab index across route transitions
- Extract shared MenuDivider, UserAvatar.initialsFromName helpers
- Move EnquiryDetailsMockHelper out of models file (SoC)

fix: add back button to call report, wire notification nav, fix ListTile ink splash

- Replace custom CallReportHeader with shared ScreenHeader in call report
  screen for consistent title sizing and back button behavior
- Add route to Notifications menu item in profile page so it navigates to
  notifications screen
- Wrap ListTile in Material widget to fix "ink splashes may be invisible"
  assertion when inside DecoratedBox background