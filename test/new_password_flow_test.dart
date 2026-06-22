import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/screens/new_password/new_password_screen.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets('New Password screen integration flow test', (tester) async {
    await tester.pumpWidget(createTestApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // 1. Navigate to OTP screen
    await tester.tap(find.text('Forgot password?'));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.bySemanticsLabel('Phone Number Input Field'),
      '9876543210',
    );
    await tester.tap(find.text('Send OTP'));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    // 2. Submit valid OTP and navigate to New Password
    await tester.enterText(find.byType(EditableText), '123456');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Verify OTP'));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    // 3. Verify on New Password Screen
    expect(find.text('Set new password'), findsOneWidget);
    final buttonFinder = find.widgetWithText(ElevatedButton, 'Update Password');
    expect(tester.widget<ElevatedButton>(buttonFinder).enabled, isFalse);

    // 4. Test password strength updates
    final passwordField = find.bySemanticsLabel('New password Input Field');
    await tester.enterText(passwordField, '123');
    await tester.pumpAndSettle();
    expect(find.text('Weak'), findsOneWidget);

    await tester.enterText(passwordField, '123456');
    await tester.pumpAndSettle();
    expect(find.text('Medium'), findsOneWidget);

    await tester.enterText(passwordField, '12345678');
    await tester.pumpAndSettle();
    expect(find.text('Strong'), findsOneWidget);

    // 5. Test mismatch confirm password
    final confirmField = find.bySemanticsLabel('Confirm password Input Field');
    await tester.enterText(confirmField, '87654321');
    await tester.pumpAndSettle();
    expect(find.text("Passwords don't match"), findsOneWidget);
    expect(tester.widget<ElevatedButton>(buttonFinder).enabled, isFalse);

    // 6. Test matching confirm password
    await tester.enterText(confirmField, '12345678');
    await tester.pumpAndSettle();
    expect(find.text('✓ Passwords match'), findsOneWidget);
    expect(tester.widget<ElevatedButton>(buttonFinder).enabled, isTrue);

    // 7. Submit update and verify return to Login
    final context = tester.element(find.byType(NewPasswordScreen));
    ScaffoldMessenger.of(context).clearSnackBars();
    await tester.pumpAndSettle();
    await tester.tap(buttonFinder);
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();
    expect(find.text('Sign In'), findsOneWidget);
  });
}
