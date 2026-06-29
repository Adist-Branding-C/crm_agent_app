feat: implement precise time-based follow-up categorization

Refactors follow-up categorization in the CRM application to be dynamically
computed on the fly by comparing the scheduled DateTime against the system clock,
replacing the previous static enum-based assignment.

Changes:
- lib/data/models/follow_up_models.dart:
  - Replaces `urgency` parameter in `FollowUp` with `scheduledTime` DateTime.
  - Implements dynamic `urgency` getter to categorize records into Overdue, Due Today, and Upcoming based on system date and time.
- lib/data/models/dashboard_models.dart:
  - Replaces static `isOverdue` flag on `FollowUpCall` with dynamic getter based on `scheduledTime`.
- lib/screens/view_call_log/widgets/add_follow_up_form.dart:
  - Updates submit flow to capture the selected date and time and pass it as `scheduledTime` to both `FollowUpCall` and `FollowUp` constructors.
- mock data files:
  - Updates mock records in `mock_follow_ups.dart` and `dashboard_repository_impl.dart` to define dynamic scheduled times relative to `DateTime.now()`.
- test/follow_up_logic_test.dart:
  - Introduces a new unit test suite validating the edge cases of time-based urgency categorization logic.

  feat(leads): add active visual indicator and clear option to filtering system

- Update Filter button on My Leads page to show a primary red background and white icon when any status or source filter is active.
- Add 'Clear' button to the Filter & Sort bottom sheet, visible only when a filter is applied.
- Tapping 'Clear' instantly resets the applied filters and updates the state.
- Add widget tests verifying both the active filter button visual states and the 'Clear' button functionality.

feat(tasks): implement consistent task details bottom sheet

- Create TaskDetailsBottomSheet and TaskDetailsActionBtn/TaskDetailsInfoRow widgets conforming to layout designs.
- Wire card/row tap gestures on dashboard and task screen to trigger bottom sheet details.
- Update mock tasks data to match user request references (e.g. Follow-up call, Send pricing sheet) along with realistic descriptions.
- Ensure all modified and new files strictly adhere to the under-80-lines file constraint.

feat(deals): implement Add Deal flow from Enquiry Details screen

- Register `DealsBloc` in the global `buildBlocProviders` list to sync state across views.
- Update `DealsScreen` to consume the globally provided `DealsBloc` instance.
- Modify `AddDealBottomSheetBody` to use `Navigator.pop(true)` instead of GoRouter's `context.pop(true)`.
- Capture `GoRouter` in `fab_actions.dart` before unmounting the FAB menu to enable proper screen redirection.
- Explicitly style the `AddDealSubmitButton` text and icon white for readability in both active and disabled states.
- Add `enquiry_details_add_deal_test.dart` integration test verifying the complete user flow from Enquiry Details to Deals.

feat(enquiry_details): implement empty states for Activities and Notes tabs

- Implement scrollable empty state view in ActivitiesTabView when the activities list is empty.
- Implement "No notes yet" empty state matching the design mockup in NotesHistoryList when the notes list is empty.
- Add widget tests under test/enquiry_details_activities_empty_test.dart and test/enquiry_details_notes_empty_test.dart to verify correct empty state rendering and behavior.

style: update design system spacing, typography, and component dimensions

Aligns the CRM application's spacing, paddings, typography scale, icon sizes,
and key UI components with the updated design system specifications.

Spacing and Insets:
- Updated odd-step px rhythm values (xs2=3, md=9, lg=13, xl=17) in `AppSpacing`.
- Explicitly set FAB bottom padding bottom inset to 74.

Typography:
- Configured fine-grained half-point font sizes and weights in `baseTextTheme`.
- Set input text size to 14.5 and button text size to 15.

Component Sizing and Styles:
- Avatar: Default size updated to 44; initials font size set to `size * 0.36`.
- Badge: Applied pill radius (999) and updated padding (default 4x10, small 2x8).
- KPI Cards: Set padding (compact 13, big 16) and icon chips (compact 30, big 38).
- Header Buttons: Sized `CardIconButton` to 36x36 with a border radius of 11.
- Icon Chips: Rounded action-row and feature tile icon containers (radius 11-12).
- Segmented Controls: Applied container padding 3, outer radius 12, button radius 9, and button padding 7x13.
- Chips: Set selection, date, and priority chips to 7x13 padding and pill radius.
- Bottom Sheets: Configured top/horizontal/bottom padding (11 / 17 / 29), top radius 24, and grab-handle dimensions to 38x5.
- Progress Bars: Updated standalone progress bar height to 7 and list bar height to 6.
- Screen Header: Sized header padding (54 top, 17 horizontal, bottom 7 large / 13 standard) and title text (27 large / 18 standard).
- Search Fields: Updated text font sizes to 14.5 and search icon sizes to 19.
- Empty State: Updated hero icon size to 28.

style: reduce button and text/search input heights by 2px

Decreases the heights of interactive components by 2px to align with design adjustments:
- Standard primary buttons padding reduced from 13px (AppSpacing.lg) to 12px.
- Save, Add Deal, Edit, and Create Follow-up buttons adjusted from 52px to 50px.
- Standard input text fields vertical padding reduced from 13px (AppSpacing.lg) to 12px.
- Search input field vertical padding reduced from 9px (AppSpacing.md) to 8px.
- Date picker field height reduced from 44px to 42px.
- Cleaned up unused AppSpacing import in app_button_theme.dart.

refactor: comprehensive architectural & performance audit fixes

C1 (Lifecycle Leaks): Add dispose() contract to SessionRepository;
move DataSource instantiation inside provider create: closures

C2 (Oversized Files): Split font_settings_screen.dart 608→72 lines;
extract 5 widgets + font_styles_data.dart

C3 (Tab State): Convert analytics_body to StatefulWidget with
IndexedStack + cached tab data

C4 (UI Domain Leakage): Move callLogFailureMessage to error_messages.dart;
delete dead enquiry_details_mock_helper.dart from BLoC layer

M1 (State Bloat): Split analytics_state.dart into 7 files (states/);
split search_state.dart into 6 files (states/)

M2 (State Logic): Move .take(2) filtering from SearchInitial state
to search_content.dart presentation layer

M3 (Bypassing BLoC): Add SendWhatsApp event/handler to EnquiryDetailsBloc;
WhatsApp button dispatches BLoC event instead of direct service call

M4 (Design Tokens): Add primaryRed/primaryRedLight to AppColors;
replace all 16 inline Color(0xFF...) in font settings widgets

M5 (DI Nesting): Flatten provider tree 5→4 levels by merging
AuthStateNotifier into top-level MultiProvider

M6 (Regex Constants): Create validation_patterns.dart with 8 shared
RegExp constants; update 5 Formz input files

M7 (Polymorphic Switches): Make analytics_tab_toggle data-driven via
AnalyticsTab.values.map(); extract static const _tabs in tab_selector

Mi1 (Route Security): Replace context.push(item.routePath!) with
exhaustive switch on NotificationType mapping to AppRoutes.*Path

refactor: address 12 architectural review findings — P0 bugs, P1 line-limit, P2 SOLID fixes

P0 — Critical:
- Add `buildWhen` to edit enquiry BlocBuilder to prevent full-form repaint
- Remove ChangeNotifier.addListener from splash screen (fixes memory leak)
- Remove mock follow-up fallback in leads_datasource (SRP violation)

P1 — 80-line compliance:
- Decompose font_settings_screen.dart from 636→112 lines (extract 4 widgets)
- Split analytics_repository_impl.dart from 120→54 lines (extract 2 services)
- Extract SectionTitle widget from _buildSectionHeader helper

P2 — Design principles:
- Introduce abstract HttpClient interface (DIP: auth_remote_datasource depends on abstraction, not Dio)
- Expand AppStrings from 14→50+ entries; update screens to use centralized strings
- Replace Colors.white with AppColors.surfaceWhite across theme + shared widgets

P3 — Performance:
- Parallelize DashboardBloc fetch with Future.wait
- Memoize DashboardScreen IndexedStack children list