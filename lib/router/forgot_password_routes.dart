import 'package:go_router/go_router.dart';
import '../screens/forgot_password/forgot_password_screen.dart';
import '../screens/verify_otp/verify_otp_screen.dart';
import 'app_routes.dart';

/// Builds the Forgot Password and Verify OTP routes for the application.
List<RouteBase> buildForgotPasswordRoutes() {
  return [
    GoRoute(
      name: AppRoutes.forgotPassword,
      path: AppRoutes.forgotPasswordPath,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      name: AppRoutes.verifyOtp,
      path: AppRoutes.verifyOtpPath,
      builder: (context, state) {
        final phone = state.extra as String? ?? '';
        return VerifyOtpScreen(phone: phone);
      },
    ),
  ];
}
