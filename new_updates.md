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