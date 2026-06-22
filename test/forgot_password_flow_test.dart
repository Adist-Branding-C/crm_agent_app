import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets('ForgotPassword and VerifyOTP flow test', (tester) async {
    await tester.pumpWidget(createTestApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // 1. Click Forgot Password
    await tester.tap(find.text('Forgot password?'));
    await tester.pumpAndSettle();
    expect(find.text('Enter your phone'), findsOneWidget);

    // 2. Form Validation: Empty input submit
    await tester.tap(find.text('Send OTP'));
    await tester.pumpAndSettle();
    expect(find.text('Phone number is required.'), findsOneWidget);

    // 3. Format error
    await tester.enterText(
      find.bySemanticsLabel('Phone Number Input Field'),
      'abc',
    );
    await tester.pumpAndSettle();
    expect(find.text('Phone number must contain only digits.'), findsOneWidget);

    // 4. Submit valid phone
    await tester.enterText(
      find.bySemanticsLabel('Phone Number Input Field'),
      '9876543210',
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Send OTP'));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    // 5. Verify screen transition to OTP
    expect(find.text('Enter OTP'), findsOneWidget);
    expect(find.text('Resend OTP in 0:30'), findsOneWidget);

    // 6. Test Timer Tick
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(find.text('Resend OTP in 0:29'), findsOneWidget);

    await tester.pump(const Duration(seconds: 29));
    await tester.pumpAndSettle();
    expect(find.text('Resend OTP'), findsOneWidget);

    // 7. Verify OTP validation (incomplete code)
    await tester.tap(find.widgetWithText(ElevatedButton, 'Verify OTP'));
    await tester.pumpAndSettle();
    expect(find.text('OTP code is required.'), findsOneWidget);

    // 8. Enter correct code and submit
    await tester.enterText(find.byType(EditableText), '123456');
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ElevatedButton, 'Verify OTP'));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    // 9. Verify transition back to Login
    expect(find.text('Sign In'), findsOneWidget);
  });
}
