# CRM Agent App - Recent Updates

Here is a summary of the features, improvements, and refactoring changes recently brought into the project.



### ✨ Features Implemented

* **Dark Mode Support**: Added full support for dark mode with customized color schemes and inputs.
* **Centralized Spacing System**: Built a standard spacing scale and unified padding values across all cards and lists.
* **Branded SnackBars**: Implemented custom floating notification banners for both light and dark themes.
* **Reusable UI Components**: Added helper widgets including `EmptyStateWidget` and `ResponsiveQuadGrid`.
* **Call Log Details**: Created a dedicated, interactive view screen for call log activities with edit and update capabilities.
* **Follow-Up Creation**: Added a bottom sheet dialog to easily schedule follow-up actions with custom dates and priority tags.
* **Reactive Updates**: Tied follow-up additions directly to the dashboard call log list and repositories via broadcast streams.

### 🛠️ Improvements & Bug Fixes

* **UI Cleanup & Flat Design**: Removed all drop shadows and visual elevations to create a flat, modern design layout.
* **Consistent Buttons**: Unified all application buttons to a consistent 8px soft-square corner radius.
* **Code File Length Limits**: Decomposed and split large files to strictly enforce the maximum 80-line limit.
* **Clean Architecture (DIP)**: Moved data models out of BLoC directories into dedicated data folders, decoupling domain definitions from state management.
* **Granular UI Rebuilds**: Switched wide `BlocBuilder` components to targeted `BlocSelector` controls to improve rendering performance.
* **Navigation & Routing Consistency**: Migrated native navigation calls to `context.pop()` and structured router paths with named routing.
* **Safe Error Handling**: Wrapped key callback processes in try-catch blocks and re-ordered BLoC states to prevent screen freezes.
* **Layout Fixes**: Corrected layout assertions on grid alignments, label overlaps, and chart overflows.
* **Semantic Labels**: Added accessibility semantic tags to all clickable cards, buttons, and chips.
* **Data IDs Correction**: Synchronized IDs between mock leads and mock follow-up records to fix detail loading.

### 📁 Files Modified

* **Theme & Design Systems**:
  * [app_theme_light.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/theme/app_theme_light.dart)
  * [app_theme_dark.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/theme/app_theme_dark.dart)
  * [app_colors.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/theme/app_colors.dart)
  * [app_spacing.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/theme/app_spacing.dart)
  * [app_button_theme.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/theme/app_button_theme.dart)
* **Data Models & Mock Sources**:
  * [activity_models.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/data/models/activity_models.dart)
  * [task_models.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/data/models/task_models.dart)
  * [lead_models.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/data/models/lead_models.dart)
  * [mock_follow_ups.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/data/models/mock_follow_ups.dart)
  * [mock_leads.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/data/models/mock_leads.dart)
* **State Management (BLoCs)**:
  * [call_log_bloc.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/bloc/call_log/call_log_bloc.dart) (and handlers)
  * [dashboard_bloc.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/bloc/dashboard/dashboard_bloc.dart) (and handlers)
  * [search_bloc.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/bloc/search/search_bloc.dart) (and session helpers)
  * [analytics_bloc.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/bloc/analytics/analytics_bloc.dart)
* **Screens & Widgets**:
  * [view_call_log_screen.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/screens/view_call_log/view_call_log_screen.dart) (and widgets)
  * [call_log_screen.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/screens/call_log/call_log_screen.dart) (and widgets)
  * [my_activity_screen.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/screens/my_activity/my_activity_screen.dart) (and widgets)
  * [edit_enquiry_form.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/screens/enquiry_details/widgets/edit_enquiry_form.dart)
  * [tasks_header_actions.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/screens/tasks/widgets/tasks_header_actions.dart)
* **Routing & Layout Grid**:
  * [router.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/router.dart) & [app_routes.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/router/app_routes.dart)
  * [responsive_quad_grid.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/widgets/responsive_quad_grid.dart)