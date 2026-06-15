import 'package:go_router/go_router.dart';
import 'data/auth_state_notifier.dart';
import 'data/repositories/auth_repository.dart';
import 'router/app_routes.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/deals/deals_screen.dart';
import 'screens/analytics/analytics_screen.dart';
import 'screens/attendance/attendance_screen.dart';
import 'screens/follow_ups/follow_ups_screen.dart';
import 'screens/leads/add_lead_screen.dart';
import 'screens/campaigns/campaigns_screen.dart';
import 'screens/account/account_screen.dart';

/// Configures and returns the central [GoRouter] for the application.
GoRouter createRouter(
  AuthRepository authRepository,
  AuthStateNotifier authStateNotifier,
) {
  return GoRouter(
    initialLocation: AppRoutes.splashPath,
    refreshListenable: authStateNotifier,
    redirect: (context, state) async {
      final hasToken = await authRepository.getToken() != null;
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
          final idx = tab == 'leads' ? 1 : (tab == 'tasks' ? 2 : (tab == 'search' ? 3 : 0));
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
    ],
  );
}
