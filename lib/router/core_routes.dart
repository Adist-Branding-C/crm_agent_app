import 'package:go_router/go_router.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/dashboard/dashboard_navigation_config.dart';
import '../screens/dashboard/widgets/dashboard_route_provider.dart';
import 'app_routes.dart';

/// Builds core GoRouter routes: Splash, Login, Dashboard.
List<RouteBase> buildCoreRoutes() {
  return [
    GoRoute(
      name: AppRoutes.splash,
      path: AppRoutes.splashPath,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: AppRoutes.login,
      path: AppRoutes.loginPath,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: AppRoutes.dashboard,
      path: AppRoutes.dashboardPath,
      builder: (context, state) => DashboardRouteProvider(
        initialIndex:
            DashboardNavigationConfig.tabRegistry[state
                .uri
                .queryParameters['tab']] ??
            0,
        initialFilter: state.uri.queryParameters['filter'],
      ),
    ),
  ];
}
