import 'package:go_router/go_router.dart';
import '../data/models/activity_models.dart';
import '../bloc/leads/leads_models.dart';
import '../screens/view_call_log/view_call_log_screen.dart';
import 'app_routes.dart';

/// Builds the View Call Log route.
GoRoute buildViewCallLogRoute() {
  return GoRoute(
    name: AppRoutes.viewCallLog,
    path: AppRoutes.viewCallLogPath,
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>?;
      final lead = extra?['lead'] as Lead?;
      final activity = extra?['activity'] as EnquiryActivity?;
      return ViewCallLogScreen(lead: lead, activity: activity);
    },
  );
}
