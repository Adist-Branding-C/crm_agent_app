import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/tasks/tasks_bloc.dart';
import 'data/auth_state_notifier.dart';
import 'data/repositories/auth_repository.dart';
import 'router/app_routes.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/dashboard/dashboard_navigation_config.dart';
import 'screens/dashboard/dashboard_screen.dart';
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
import 'screens/call_log/call_log_screen.dart';
import 'screens/call_log/widgets/call_log_route_provider.dart';
import 'bloc/leads/leads_models.dart';

/// Configures and returns the central [GoRouter] for the application.
GoRouter createRouter(
  AuthRepository authRepository,
  AuthStateNotifier authStateNotifier,
) {
  return GoRouter(
    initialLocation: AppRoutes.splashPath,
    refreshListenable: authStateNotifier,
    redirect: (context, state) {
      final hasToken = authRepository.isAuthenticated;
      final loc = state.matchedLocation;
      final isAuthPath = loc == AppRoutes.loginPath || loc == AppRoutes.splashPath;
      if (!hasToken && !isAuthPath) return AppRoutes.loginPath;
      if (hasToken && isAuthPath) return AppRoutes.dashboardPath;
      return null;
    },
    routes: [
      GoRoute(name: AppRoutes.splash, path: AppRoutes.splashPath, builder: (c, s) => const SplashScreen()),
      GoRoute(name: AppRoutes.login, path: AppRoutes.loginPath, builder: (c, s) => const LoginScreen()),
      GoRoute(
        name: AppRoutes.dashboard,
        path: AppRoutes.dashboardPath,
        builder: (context, state) {
          final tab = state.uri.queryParameters['tab'];
          final idx = DashboardNavigationConfig.tabRegistry[tab] ?? 0;
          if (state.uri.queryParameters['filter'] == 'overdue') {
            context.read<TasksBloc>().add(const FilterChanged(TasksFilter.overdue));
          }
          return DashboardScreen(initialIndex: idx);
        },
      ),
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
      GoRoute(
        name: AppRoutes.callLog,
        path: AppRoutes.callLogPath,
        builder: (c, s) => CallLogRouteProvider(state: s),
      ),
    ],
  );
}
