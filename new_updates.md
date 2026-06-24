# CRM Agent App - Recent Updates

Recent updates to the CRM Agent application including new features, bug fixes, refactoring for file-line constraints, and type-safety enhancements.

### ✨ New Features (What was built from scratch)
* **Authentication Loader**: Added a circular progress indicator during login API calls.
* **Search History**: Persisted recent search queries inside `SearchBloc` across search operations.
* **Calculators**: Extracted dedicated analytics calculators for leads and deals.

### 🛠️ Fixes & Refinements (What was modified or corrected)
* **Error Handling**: Rendered descriptive server-returned error messages on invalid logins.
* **Crash Fix**: Resolved a runtime null-pointer exception in `ViewCallLogScreen`'s initialization.
* **Type Safety**: Replaced unsafe casts (`as`) with safe checks (`is`) in BLoC builders.
* **Layout Fix**: Wrapped deal-adding sheet in scroll view to stop keyboard layout overflows.
* **Code Split**: Segmented massive blocs (leads, search, analytics, routing) into handlers to meet line limit rules.
* **Modular UI**: Extracted text themes, stats grids, and sub-widgets into dedicated component files.
* **Build / Tests**: Fixed widget test pop context navigation and updated currency formatting assertions.

### 📁 Key Files Edited (A simple list of the primary files changed)
* [auth_remote_datasource.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/data/datasources/auth_remote_datasource.dart) - Configured server-returned invalid login error handling.
* [login_bloc.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/bloc/login/login_bloc.dart) - Added loading status support.
* [login_body.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/screens/login/widgets/login_body.dart) - Integrated progress loader indicator.
* [search_bloc.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/bloc/search/search_bloc.dart) & [search_handlers.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/bloc/search/search_handlers.dart) - Managed queries and search history.
* [view_call_log_screen.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/screens/view_call_log/view_call_log_screen.dart) - Fixed activity state null-pointer crash.
* [log_details_section.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/screens/view_call_log/widgets/log_details_section.dart) - Isolated styling and row configurations.
* [leads_bloc.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/bloc/leads/leads_bloc.dart) - Split handlers into query and mutation modules.
* [leads_analytics_calculator.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/data/repositories/leads_analytics_calculator.dart) - Separated analytics concerns.
* [deals_analytics_calculator.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/data/repositories/deals_analytics_calculator.dart) - Separated deals reporting operations.
* [add_deal_bottom_sheet_content.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/screens/enquiry_details/widgets/add_deal_bottom_sheet_content.dart) - Resolved layout scroll views.
* [router.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/router.dart) - Partitioned routes to modular sub-files.
* [app_text_theme.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/lib/theme/app_text_theme.dart) - Decomposed typography definitions.
* [login_api_integration_test.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/test/login_api_integration_test.dart) - Validated auth responses.
* [currency_formatter_test.dart](file:///c:/Users/ashwin/Projects/adist_project/crm_agent_app/test/currency_formatter_test.dart) - Matched lakhs formatting.