arch: split AnalyticsLoaded state, consolidate error messages, harden DI, fix lifecycle race

- **State explosion (P1)**: Replaced 13-field `AnalyticsLoaded` with `LeadsTabData` /
  `DealsTabData` sub-models. Lazy data — only active tab's data held at once.
- **DI hardening (P2)**: Made `PhoneDialerService` a required constructor parameter
  in `CallLogBloc` (was optional default, violating DIP).
- **Lifecycle race (P1)**: Fixed `DashboardRouteProvider` — removed async
  `addPostFrameCallback` + `setState` pattern; `_tabNotifier` now created
  synchronously in `initState`.
- **Error duplication (P3)**: Replaced 5 private `_errorString` functions across
  `dashboard_body`, `enquiry_details_body`, `enquiry_details_screen`,
  `analytics_body`, `tasks_list_view` with centralized `bloc/error_messages.dart`
  extensions on failure enums.
- **Data-layer leak (P3)**: Moved `AppStrings` from `data/constants.dart` to
  `screens/app_strings.dart`; deleted `data/constants.dart`.
- **context.read in build (P0)**: Fixed worst offenders — `add_lead_form.dart`
  captures bloc in `initState`; `analytics_body.dart` captures at `build()` level;
  `leads_filter_tabs.dart` resolves inside conditional builder.
- **File length**: Collapsed `UpdateEnquiryDetails.props` in
  `enquiry_details_event.dart` from 10→2 lines (now 75 lines, below 80).
- **Theme abstraction**: Created `theme/app_context_theme.dart` —
  `ThemeColors` extension on `BuildContext` (`context.primary`, `context.success`,
  `context.textDark`, etc.) for migrating away from static `AppColors.*` references.
- New files: `analytics_tab_data.dart`, `error_messages.dart`,
  `app_strings.dart`, `app_context_theme.dart`.

feat: implement Add Deal flow with state-driven navigation to Deals page

- Add DealAdded state (success/error) to DealsBloc for deterministic
  post-submission feedback
- Register DealsBloc globally in app_bloc_providers (session-scoped)
- Add addDeal() to DealsRepository; update impl with mutable list
- Wire Add Deal button in FAB menu to open bottom sheet form
- Move submission logic into AddDealBottomSheetBody (StatefulWidget):
  validate, dispatch AddDeal, await DealAdded stream result
- Add loading/error state to AddDealController; show inline error
  and spinner on submit button
- On success: pop bottom sheet → pushNamed(AppRoutes.deals)
- On failure: show error message, re-enable form for retry
- Remove local DealsBloc provider from DealsScreen (now global)
- Capture GoRouter before await to avoid context invalidation

Feat implimentd whatsaap bottom sheet and Edit lead page

feat(analytics): upgrade analytics screen and implement filter bottom sheet

- Integrated dynamic Leads and Deals tab toggle on the Analytics screen.
- Added support for Deal analytics metrics (Open Pipeline, Won Deals, Win Rate, Average Deal Size, Deals by Stage donut chart, and Stage bar charts).
- Added a filter bottom sheet matching the mockup design, including date picker fields, date range chips, and status/source filters.
- Styled the filter button in the screen header with a solid red background (AppColors.primaryColor).
- Created a helper class (AnalyticsCalculationHelper) to aggregate metrics, map client names, and simulate date filter ranges.
- Organized code into highly modular, decoupled widgets with files strictly under 80 lines of code.
- Deleted obsolete analytics grid and section files.
- Updated automated integration tests in test/analytics_test.dart to verify tab navigation, filtering, and metric updates.

arch: fix P0 race conditions, enforce 80-line cap, const shadows, eliminate withValues allocations

- **P0**: Fix async `setState` race in `DashboardRouteProvider` (postFrameCallback);
  close `EnquiryDetailsBloc` leak via route `extra` (use `BlocProvider(create:)`)
- **80-line cap**: Split 8 over-limit files — split `enquiry_details_handlers.dart`
  into 5 domain handlers; extract `AccountBody`/`AccountContent`; extract
  `WhatsAppBottomSheetBody`; extract `AnalyticsFilterSections`; extract
  `AddDealStageChip`; compact formatters in remaining files
- **Performance**: `AppShadows` → `static const` (no per-access allocation);
  7 alpha-baked `Color` consts added to `AppColors` replacing 8 `withValues(alpha:)`
  calls across `filter_chip_bar`, `quick_action_tile`, `deals_stats_card`,
  `deals_toggle`, `fab_menu_item`, `login_header`, `splash_content`
- **SRP**: Split `lead_presentation_extensions.dart` into 3 files
  (`lead_status_extensions`, `lead_source_extensions`, `lead_initials_extensions`)
- **Duplication**: Consolidated duplicated `_Dot` widgets into shared `ColoredDot`
- **Style**: Replaced hardcoded `Color(0xFFD97706)` with `AppColors.warningDark`

---

**Demo video:** https://drive.google.com/file/d/1J3dTPOTziBJjTBUhy38XaQ1ukuIbtFyx/view?usp=sharing