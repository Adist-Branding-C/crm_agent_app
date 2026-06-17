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