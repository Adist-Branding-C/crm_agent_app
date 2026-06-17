# Recent Updates

## feat: unify task data, fix View All nav, add row-tap + empty-state hide

- Replace GoRouter-based tab switching with `DashboardTabNotifier` so "View All" works regardless of URL
- Remove duplicate `TaskItem` model; dashboard now reads pending tasks directly from `TasksBloc`
- Tap task row to navigate to Tasks screen with Pending filter pre-selected
- Hide the Tasks section (heading, View All, card) when there are no pending tasks

## fix(search): wire follow-up card tap navigation and call dialer in search results

- Rename `FollowUpItemCard` `onTap` → `onCallTap`, add `onCardTap` for detail navigation
- Create shared `SearchFollowUpTile` widget to remove callback duplication
- Replace no-op callbacks in `search_result_tile` and `search_suggestions`
- Update `follow_up_list_body` to use renamed `onCallTap`

## refactor: fix 11 architectural issues from code review

- Fix #1: Dispatch `ResetCallLog` after call log route push
- Fix #2: Remove `LeadsRepository` bypass in `CallLogRouteProvider`; use route extra
- Fix #3: Replace `didChangeDependencies` with `initState` + `postFrameCallback`
- Fix #4: Split `AddLeadState` into `AddLeadFormInputs` + `AddLeadSubmissionStatus`
- Fix #5: Decouple deals toggle from `BlocBuilder` via `DealsViewNotifier`
- Fix #6: Replace `context.watch` with `context.select` in `DashboardBody`
- Fix #7: Replace switch with const Map registry for timeline configs
- Fix #8: Extract `FabMenuAction` model for OCP-driven FAB items
- Fix #9: Extract `TaskMetaRow` widget and `TaskPriorityDisplayColor` extension
- Fix #10: Replace `BlocBuilder` with `context.select` + record in `LeadsHeader`
- Fix #11: Replace inline `TextStyle` with theme-derived style in `CampaignCard`

## refactor: apply architectural review fixes — SOLID, DRY, error handling

- P0.1: Remove hardcoded phone fallback in `call_log_handlers` (return `CallLogFailure` instead of dummy number)
- P0.2: Remove implicit `AuthRepositoryImpl` fallback in `app.dart`
- P0.3: Add global error handlers (`FlutterError` + `PlatformDispatcher`)
- P1.1: Add `buildWhen` to wide `BlocBuilder`s (dashboard, analytics, tasks)
- P1.2: Extract `_getBarColor` to `LeadStatus` / `LeadSource` extension getters
- P1.3: Convert `DashboardNavigationItem.bodyBuilder` from `WidgetBuilder` to direct `Widget`
- P1.4: Remove redundant `context.select` inside `BlocBuilder` in login_form
- P2.2: Extract shared `FilterChipBar` widget from leads/tasks filter tabs
- P2.3: Split `LeadsRepository` per ISP → `LeadsRepository` (CRUD) + `ActivityRepository`; update BLoCs and test mocks
- P3.1: Extract shared `BottomSheetHandle` widget

## fix: restore task completion checkbox in task list view

- Fix overly restrictive `buildWhen` filter in `TasksListView` that prevented rebuild when `TasksLoaded` content changed
- Switch from runtimeType check to Equatable deep equality (`prev != curr`) so toggling completion re-renders the `TaskCard`

## refactor: complete architectural fix series — error codes, OCP, ISP, performance, 80-line compliance

- Refactor `search_bloc` to 80 lines by extracting `_ensureLoaded()` and removing duplicate data fetch
- Replace UI strings in 18 BLoC files with domain-specific failure enums
- Replace per-result `BlocBuilder<TasksBloc>` with single `context.select` `taskMap`
- Consolidate switch chains into shared extensions and delete `filter_status_helpers.dart`
- Lift `DashboardBloc` from `DashboardScreen.build()` to `DashboardRouteProvider`
- Split `ActivityDataSource` from `LeadsDataSource`; wire independently in `app_providers.dart`

## refactor: architectural fixes from code review — perf, SOLID, memory safety

- Make `AuthRepositoryImpl.init()` idempotent with an early return guard
- Add `dispose()` to `LeadsRepository`; close `StreamController` in impl and test mocks
- Remove `context.read` fallback from `LoginScreen`; inject via `BlocProvider` only
- Add `buildWhen` to 11 `BlocBuilder`s (attendance, campaigns, follow_ups, call_log, search, splash, leads, deals)
- Extract `DealsGrouping` extension on `List<Deal>` and reuse in `DealsPipelineView`
- Replace UI string `AppStrings.authFailed` in `LoginBloc` with `AuthFailure` enum
- Extract `SearchBloc` in-memory cache into `SearchCache`
- Make currency formatter configurable (`symbol`, `useIndianNotation`)

## refactor: extract private helpers, remove dead code, scope bloc listener

- Split `MetricCard` (124 lines → 39) into `MetricCardVertical` / `MetricCardHorizontal`
- Extract `QuickActionTile`, `StatusLabel`, `StatusChip`, `AnalyticsSummaryGrid`, `StatusMetricsSection`, `SourceMetricsSection`, `PendingTasksSection`
- Remove dead `CallLogFailure.error` stub getter
- Move global `BlocListener<CallLogBloc>` into scoped `CallLogNavigationHandler`
- Switch widgets to shared `MetricCard`, removing 3 duplicate pattern files
- Merge `task_priority_color_ext.dart` into `task_priority_extensions.dart`
