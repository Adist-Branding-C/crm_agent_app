# Project Updates

## Auth & Recovery Flow

### Forgot Password & Verify OTP
- **Data:** Added mock `sendOtp`/`verifyOtp` methods to `AuthRepository` / `AuthRepositoryImpl`.
- **Routing:** Added `/forgot-password` and `/verify-otp` routes; extracted GoRouter builders into `router/forgot_password_routes.dart`; whitelisted for unauthenticated access.
- **State:** Implemented `ForgotPasswordBloc` (Formz `ForgotPasswordPhone`), `VerifyOtpBloc` (6-digit code, submission state, resend countdown timer).
- **UI:** Wired `ForgotPasswordLink` on login screen; built `ForgotPasswordScreen`/`VerifyOtpScreen` with reusable `CustomTextField`/`CustomButton`; extracted `OtpInputWidget` and `ResendTimerWidget`.
- **Tests:** Integration suite in `test/forgot_password_flow_test.dart`.

### New Password Screen
- Added `updatePassword` to `AuthRepository` and mock.
- Defined `/new-password` route, whitelisted for guest access, linked from `VerifyOtpScreen`.
- Created `NewPasswordBloc` (Formz complexity/match validators).
- Built `PasswordStrengthMeter`, `ConfirmPasswordInputWidget`, `NewPasswordBody`, `NewPasswordHeaderWidget`.
- Integration tests in `new_password_flow_test.dart`; updated `forgot_password_flow_test.dart`.

### Change Password (Profile)
- Added `changePassword` method to `AuthRepository` + mock.
- Registered routes mapped to `ChangePasswordScreen`; replaced "Settings" with "Change Password" in `MenuList`.
- Implemented `ChangePasswordBloc` with 3 Formz validators (`ChangeCurrentPassword`, `ChangeNewPassword`, `ChangeConfirmPassword`).
- Built responsive UI components; stretched body column for full-width header box.
- Integration tests in `change_password_flow_test.dart`.

## UI/UX Updates

### Call Action Bottom Sheet
- Replaced direct dialing with `CallActionsBottomSheet` offering Call now, WhatsApp, Send SMS, Copy number.
- Added `SmsService` for system SMS intents; integrated clipboard copy with feedback.
- Updated `CallLogBloc` events/states: `LaunchDialer`, `CallLogBottomSheetTriggered`.
- Modular widgets: `CallActionsBottomSheet`, `CallActionsBottomSheetBody`, `CallActionsSheetHeader`, `CallActionTile` (each < 80 lines).
- Extracted mocks to `test/mock_repositories.dart`; updated `call_log_test.dart` and `follow_ups_test.dart`.

### Edit Profile Screen
- Created screen linked from Profile menu; decomposed into modular widgets under `lib/screens/account/edit_profile/`.
- Extended `AccountProfile` model with `joinedDate`, `baseLocation`, `monthlyTarget`, `achievedAmount`.
- Added `UpdateProfile` event + states to `AccountBloc`; `updateProfile` with in-memory caching in `AccountRepositoryImpl`.
- Reactive target progress via `ValueListenableBuilder`; updated `SelectionChip` styling (light red highlight).
- Updated `account_bloc_test.dart`.

### Attendance History Screen
- Routes and router integration; `AttendanceHistoryModel` / `AttendanceHistoryLogModel` data structures.
- Extended `AttendanceRepository` with history-loading capabilities and mock data.
- `AttendanceHistoryBloc` (BLoC + part/part-of directives).
- Visual subcomponents: summary cards, stats counters, calendar grid, daily activity logs.
- Integration test covering tab toggling and day selections.

## Bug Fixes
- **GoRouter context crash** — Nested `CallLogNavigationHandler` inside `MaterialApp.router`'s builder with global `rootNavigatorKey`; resolved modal presentation and post-call navigation exceptions.
- **StreamController double-close** — Guarded `StreamController.close()` in `LeadsRepositoryImpl.dispose()`.
- **Inline state loss** — Converted `HistoryContent` to `StatefulWidget`.
- **Unsafe cast** — Added type check + default initializers in `AnalyticsFilterSheet.initState`.
- **Nested ValueListenableBuilder cascade** — Extracted `HistoryLoadedBody` from `history_content.dart` (108 → 48 lines).

## Architecture & Code Quality

### 80-Line Limit Enforcement
All new/modified files comply strictly. Decompositions:
| File | Before | After |
|---|---|---|
| `history_summary_card` | 107 | 42 |
| `history_calendar_view` | 80 | 34 |
| `change_password_body` | 82 | 46 |
| `change_password_handlers.dart` | 92 | 66 + 20 |
| `history_content.dart` | 108 | 48 |

### Separation of Concerns (SoC) & Single Responsibility (SRP)
- Moved `error_messages.dart` from `bloc/` → `screens/`.
- Moved activity title formatting out of BLoC into data model factory.
- Extracted private `_build*` methods from bloated widgets into standalone files.
- Extracted `computeDealTypeMetrics` into `deal_type_calculator.dart`.
- Extracted inline validator lambdas into `PersonalDetailsValidators` class.
- Moved WhatsApp template static data from model → repository.
- Replaced `part/part-of` in `custom_text_field.dart` with standalone `TextFieldLabel` import.
- Split analytics tab content into 5 sub-widgets (`deal_stage_donut`, `deal_pipeline_chart`, `deal_type_chart`, `lead_status_donut`, `lead_source_chart`) to isolate un-memoized mapping.

### Interface Segregation (ISP)
- Segregated `AuthRepository` into `SessionRepository`, `OtpRepository`, `PasswordRepository`; narrowed all 6 consuming BLoCs to their required interface.

### Dependency Inversion & Decoupling
- Removed `BlocListener<CallLogBloc>` from `DashboardScreen` (cross-feature coupling).
- Dropped unused `dashboard_bloc` import from `dashboard_screen.dart`.
- Extracted mock repository classes to `test/mock_repositories.dart`.
- Documented `CallLogBloc` global provisioning trade-off (required by root-level listeners).

### State Management & Performance
- Moved `_allLeads` mutable cache into `LeadsLoaded` state as immutable `allLeads` field.
- Replaced hardcoded `Color(0xFF1E293B)` with `AppColors.textDark` token.
- Replaced `NotificationBell` String count with `int`.

## Testing

| Test File | Purpose |
|---|---|
| `test/forgot_password_flow_test.dart` | Entry points, validators, resend timers, success redirections |
| `test/new_password_flow_test.dart` | Complexity/match validation, navigation |
| `test/change_password_flow_test.dart` | All validation and navigation flows |
| `test/attendance_history_test.dart` | Tab toggling, day selections |
| `test/call_log_test.dart` | Bottom sheet interaction flows |
| `test/follow_ups_test.dart` | Bottom sheet interaction flows |
| `test/account_bloc_test.dart` | Profile updating flows |
| `test/add_lead_bloc_validation_test.dart` | Compiler errors resolved (deleted `constants.dart`) |

---

**Status:** All 37 tests passing. `flutter analyze`: 0 errors, 0 warnings. 22 architectural review items resolved across 13 new files and 15 modified files.
