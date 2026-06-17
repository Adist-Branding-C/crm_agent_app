# Recent Updates

feat: unify task data, fix View All nav, add row-tap + empty-state hide

- Replace GoRouter-based tab switching with DashboardTabNotifier so
  "View All" always works regardless of current URL
- Remove duplicate TaskItem model; dashboard now reads pending tasks
  directly from TasksBloc (single source of truth)
- Tapping a task row navigates to the Tasks screen with the Pending
  filter pre-selected
- Hide the entire Tasks section (heading, View All, card) when there
  are no pending tasks to display

  fix(search): wire follow-up card tap navigation and call dialer in search results

- Rename FollowUpItemCard onTap→onCallTap, add onCardTap for detail navigation
- Create shared SearchFollowUpTile widget to avoid callback duplication
- Replace no-op callbacks in search_result_tile and search_suggestions
- Update follow_up_list_body to use renamed onCallTap parameter

refactor: fix 11 architectural issues from code review

- Fix #1: ResetCallLog dispatch after call log route push (fixes nav loop)
- Fix #2: Remove LeadsRepository bypass in CallLogRouteProvider; use route extra
- Fix #3: Replace didChangeDependencies with initState + postFrameCallback
- Fix #4: Split AddLeadState into AddLeadFormInputs + AddLeadSubmissionStatus
- Fix #5: Decouple deals toggle from BlocBuilder via DealsViewNotifier
- Fix #6: Replace context.watch with context.select in DashboardBody
- Fix #7: Replace switch with const Map registry for timeline configs
- Fix #8: Extract FabMenuAction model for OCP-driven FAB items
- Fix #9: Extract TaskMetaRow widget and TaskPriorityDisplayColor extension
- Fix #10: Replace BlocBuilder with context.select + record in LeadsHeader
- Fix #11: Replace inline TextStyle with theme-derived style in CampaignCard

refactor: apply architectural review fixes — SOLID, DRY, error handling

- P0.1: Remove hardcoded phone fallback in call_log_handlers (return
  CallLogFailure when no lead matches instead of creating one with
  '9876543210')
- P0.2: Remove implicit AuthRepositoryImpl fallback in app.dart
- P0.3: Add global error handlers (FlutterError + PlatformDispatcher)
- P1.1: Add buildWhen to wide BlocBuilders (dashboard, analytics, tasks)
- P1.2: Extract _getBarColor to LeadStatus/LeadSource extension getters
- P1.3: Convert DashboardNavigationItem.bodyBuilder (WidgetBuilder) to
  direct Widget body field
- P1.4: Remove redundant context.select inside BlocBuilder in login_form
- P2.2: Extract shared FilterChipBar widget from leads/tasks filter tabs
- P2.3: Split LeadsRepository per ISP → LeadsRepository (CRUD) +
  ActivityRepository; update BLoCs and test mocks
- P3.1: Extract shared BottomSheetHandle widget (duplicated in
  add_task_bottom_sheet and filter_sheet_body)


fix: restore task completion checkbox in task list view

Fix overly restrictive buildWhen filter in TasksListView that prevented
rebuild when TasksLoaded state content changed (same runtimeType).
Changed from runtimeType check to Equatable deep equality (prev != curr)
so toggling a task's completion status re-renders the TaskCard.
