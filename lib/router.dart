import 'package:go_router/go_router.dart';
import 'data/auth_state_notifier.dart';
import 'router/navigator_key.dart';
import 'data/repositories/session_repository.dart';
import 'router/app_routes.dart';
import 'router/core_routes.dart';
import 'router/feature_routes.dart';
import 'router/user_routes.dart';
import 'router/edit_enquiry_route.dart';
import 'router/forgot_password_routes.dart';
import 'router/attendance_routes.dart';
import 'router/view_call_log_route.dart';

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
      ...buildFeatureRoutes(),
      ...buildUserRoutes(),
      buildEditEnquiryRoute(),
      ...buildForgotPasswordRoutes(),
      buildAttendanceHistoryRoute(),
      buildViewCallLogRoute(),
    ],
  );
}
