import 'package:go_router/go_router.dart';
import 'data/auth_state_notifier.dart';
import 'router/navigator_key.dart';
import 'data/repositories/session_repository.dart';
import 'router/app_routes.dart';
import 'router/core_routes.dart';
import 'screens/deals/deals_screen.dart';
import 'screens/analytics/analytics_screen.dart';
import 'screens/attendance/attendance_screen.dart';
import 'screens/follow_ups/follow_ups_screen.dart';
import 'screens/leads/add_lead_screen.dart';
import 'screens/campaigns/campaigns_screen.dart';
import 'screens/account/account_screen.dart';
import 'screens/enquiry_details/enquiry_details_screen.dart';
import 'screens/notifications/notifications_screen.dart';
import 'screens/tasks/task_details_screen.dart';
import 'screens/call_log/widgets/call_log_route_provider.dart';
import 'screens/call_report/call_report_screen.dart';
import 'screens/my_activity/my_activity_screen.dart';
import 'router/edit_enquiry_route.dart';
import 'router/forgot_password_routes.dart';
import 'screens/change_password/change_password_screen.dart';
import 'screens/account/edit_profile/edit_profile_screen.dart';
import 'router/attendance_routes.dart';

GoRouter createRouter(
  SessionRepository authRepository,
  AuthStateNotifier authStateNotifier,
) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.splashPath,
    refreshListenable: authStateNotifier,
    redirect: (context, state) {
      final loc = state.matchedLocation;
      if (!authRepository.isInitialized) {
        return loc == AppRoutes.splashPath ? null : AppRoutes.splashPath;
      }
      final hasToken = authRepository.isAuthenticated;
      final isAuth = AppRoutes.isAuthRoute(loc);
      if (!hasToken && !isAuth) return AppRoutes.loginPath;
      return (hasToken && isAuth) ? AppRoutes.dashboardPath : null;
    },
    routes: [
      ...buildCoreRoutes(),
      GoRoute(name: AppRoutes.addLead, path: AppRoutes.addLeadPath, builder: (c, s) => const AddLeadScreen()),
      GoRoute(name: AppRoutes.deals, path: AppRoutes.dealsPath, builder: (c, s) => const DealsScreen()),
      GoRoute(name: AppRoutes.analytics, path: AppRoutes.analyticsPath, builder: (c, s) => const AnalyticsScreen()),
      GoRoute(name: AppRoutes.attendance, path: AppRoutes.attendancePath, builder: (c, s) => const AttendanceScreen()),
      GoRoute(name: AppRoutes.followUps, path: AppRoutes.followUpsPath, builder: (c, s) => const FollowUpsScreen()),
      GoRoute(name: AppRoutes.campaigns, path: AppRoutes.campaignsPath, builder: (c, s) => const CampaignsScreen()),
      GoRoute(name: AppRoutes.account, path: AppRoutes.accountPath, builder: (c, s) => const AccountScreen()),
      GoRoute(name: AppRoutes.enquiryDetails, path: AppRoutes.enquiryDetailsPath, builder: (c, s) => EnquiryDetailsScreen(leadId: s.pathParameters['id'] ?? '')),
      GoRoute(name: AppRoutes.notifications, path: AppRoutes.notificationsPath, builder: (c, s) => const NotificationsScreen()),
      GoRoute(name: AppRoutes.taskDetails, path: AppRoutes.taskDetailsPath, builder: (c, s) => TaskDetailsScreen(taskId: s.pathParameters['id'] ?? '')),
      GoRoute(name: AppRoutes.callLog, path: AppRoutes.callLogPath, builder: (c, s) => CallLogRouteProvider(state: s)),
      GoRoute(name: AppRoutes.callReport, path: AppRoutes.callReportPath, builder: (c, s) => const CallReportScreen()),
      GoRoute(name: AppRoutes.myActivity, path: AppRoutes.myActivityPath, builder: (c, s) => const MyActivityScreen()),
      GoRoute(name: AppRoutes.changePassword, path: AppRoutes.changePasswordPath, builder: (c, s) => const ChangePasswordScreen()),
      GoRoute(name: AppRoutes.editProfile, path: AppRoutes.editProfilePath, builder: (c, s) => const EditProfileScreen()),
      buildEditEnquiryRoute(),
      ...buildForgotPasswordRoutes(),
      buildAttendanceHistoryRoute(),
    ],
  );
}
