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

  fix: resolve 7 architectural violations from codebase review

- Extract computeDealTypeMetrics into deal_type_calculator.dart to fix
  80-line limit violation in analytics_calculation_helper.dart
- Replace hardcoded hex Color(0xFF1E293B) with AppColors.textDark token
- Guard unsafe cast in AnalyticsFilterSheet.initState with type check
  and default initializers
- Move _allLeads mutable cache into LeadsLoaded state as immutable
  allLeads field; update all handlers and consumers
- Guard StreamController.close() against double-invoke in
  LeadsRepositoryImpl.dispose()
- Remove BlocListener<CallLogBloc> from DashboardScreen to eliminate
  cross-feature coupling
- Drop unused dashboard_bloc import from dashboard_screen.dart

All 37 tests pass. flutter analyze: 0 errors, 0 warnings.

feat(auth): implement New Password screen and recovery flow integration

- Add `updatePassword` to `AuthRepository` and mock implementation.
- Define `/new-password` route, whitelist it for guest access, and link transition from `VerifyOtpScreen`.
- Create `NewPasswordBloc` using standard Formz validators for complexity and match verification.
- Implement responsive UI components for the New Password screen:
  - `PasswordStrengthMeter` (length-based complexity indicators).
  - `ConfirmPasswordInputWidget` (real-time validation mismatch alerts).
  - Isolated screen layouts (`NewPasswordBody`, `NewPasswordHeaderWidget`).
- Add integration widget tests in `new_password_flow_test.dart` and update `forgot_password_flow_test.dart`.
- Keep all created and modified source files strictly under the 80 lines of code limit.

feat: redesign call action flow with actions bottom sheet and fix GoRouter context crash

- Redesigned call action buttons across screens to open a custom CallActionsBottomSheet instead of dialing immediately.
- Added bottom sheet options: Call now, WhatsApp, Send SMS, and Copy number.
- Added `SmsService` to launch system SMS intents and integrated clipboard copy with feedback.
- Updated `CallLogBloc` events and states to include `LaunchDialer` and `CallLogBottomSheetTriggered` for handling sheet interactions.
- Nest `CallLogNavigationHandler` inside `MaterialApp.router`'s builder and configure a global `rootNavigatorKey` for GoRouter.
- Resolved GoRouter context exceptions by utilizing `rootNavigatorKey.currentContext` inside `CallLogNavigationHandler` during modal presentation and post-call logging navigation.
- Created modular widgets (each strictly < 80 lines): `CallActionsBottomSheet`, `CallActionsBottomSheetBody`, `CallActionsSheetHeader`, and `CallActionTile`.
- Extracted mock repository classes to `test/mock_repositories.dart` and updated `test/call_log_test.dart` and `test/follow_ups_test.dart` to verify the redesigned sheet interaction flows.