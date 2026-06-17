import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets('Validation error messages are displayed properly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // 1. Submit empty fields
    await tester.tap(find.text('Sign In'));
    await tester.pumpAndSettle();
    expect(find.text('Phone number is required.'), findsOneWidget);

    // 2. Enter valid phone number -> phone error clears, password error shows
    await tester.enterText(
      find.bySemanticsLabel('Phone Number Input Field'),
      '9876543210',
    );
    await tester.pumpAndSettle();
    expect(find.text('Password is required.'), findsOneWidget);

    // 3. Clear phone and type invalid digits length -> phone error overrides
    await tester.enterText(
      find.bySemanticsLabel('Phone Number Input Field'),
      '1234',
    );
    await tester.pumpAndSettle();
    expect(
      find.text('Phone number must be at least 10 digits.'),
      findsOneWidget,
    );

    // 4. Non-digits format
    await tester.enterText(
      find.bySemanticsLabel('Phone Number Input Field'),
      '1234abc',
    );
    await tester.pumpAndSettle();
    expect(find.text('Phone number must contain only digits.'), findsOneWidget);

    // 5. Correct phone, but type invalid password length
    await tester.enterText(
      find.bySemanticsLabel('Phone Number Input Field'),
      '9876543210',
    );
    await tester.enterText(
      find.bySemanticsLabel('Password Input Field'),
      '123',
    );
    await tester.pumpAndSettle();
    expect(
      find.text('Password must be at least 6 characters.'),
      findsOneWidget,
    );

    // 6. Enter valid credentials -> all errors clear
    await tester.enterText(
      find.bySemanticsLabel('Password Input Field'),
      'secure123',
    );
    await tester.pumpAndSettle();
    expect(find.text('Phone number must be at least 10 digits.'), findsNothing);
    expect(find.text('Password must be at least 6 characters.'), findsNothing);
  });
}
