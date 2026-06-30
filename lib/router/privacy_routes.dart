import 'package:go_router/go_router.dart';
import '../screens/privacy_policy/privacy_policy_screen.dart';
import 'app_routes.dart';

/// Builds the route for the Privacy Policy screen.
GoRoute buildPrivacyRoute() {
  return GoRoute(
    name: AppRoutes.privacyPolicy,
    path: AppRoutes.privacyPolicyPath,
    builder: (context, state) => const PrivacyPolicyScreen(),
  );
}
