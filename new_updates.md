feat(auth): implement Forgot Password and Verify OTP feature flows

- Data Layer:
  - Add mock `sendOtp` and `verifyOtp` methods to `AuthRepository` and `AuthRepositoryImpl`.

- Routing:
  - Add `forgotPassword` and `verifyOtp` route names and paths to `AppRoutes`.
  - Extract GoRouter builders into `router/forgot_password_routes.dart` to maintain the < 80 lines constraint.
  - Whitelist the new paths in `router.dart` to allow unauthenticated access.

- State Management (BLoCs):
  - Implement `ForgotPasswordBloc` using Formz validations (`ForgotPasswordPhone`).
  - Implement `VerifyOtpBloc` handling the 6-digit verification code, submission state, and the resend countdown timer.
  - Structure both BLoCs with cohesive parts (`event`, `state`, `inputs`) to keep files well below the 80-line limit.

- Presentation:
  - Wire `ForgotPasswordLink` on the Login Screen to push the forgot password route.
  - Implement `ForgotPasswordScreen` and `ForgotPasswordBody` using reusable `CustomTextField` and `CustomButton`.
  - Implement `VerifyOtpScreen` and `VerifyOtpBody`.
  - Extract custom `OtpInputWidget` (invisible `TextFormField` with a reactive 6-box row layout) and `ResendTimerWidget`.

- Testing:
  - Create integration test suite in `test/forgot_password_flow_test.dart` asserting entry points, validators, resend timers, and success redirections.
  - Resolve compiler errors in `test/add_lead_bloc_validation_test.dart` and `test/account_bloc_test.dart` caused by deleted `constants.dart` references and interface updates.

  All 17 architectural review issues fixed: 80-line violations, SoC/SRP/DIP violations, mixed state management, async gaps, and performance optimizations across 13 new files and 15 modified files. 37/37 tests passing, zero analyzer errors.