import 'package:crm_agent_app/main.dart';
import 'package:crm_agent_app/screens/dashboard/dashboard_screen.dart';
import 'package:crm_agent_app/screens/login/login_screen.dart';
import 'package:crm_agent_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Test suite containing widget and integration flow tests for the CRM Agent app.
void main() {
  testWidgets('Splash Screen flow and navigation smoke test', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // 1. Verify that we are on the Splash Screen initially.
    expect(find.byType(SplashScreen), findsOneWidget);

    // Verify that the title and tagline are visible on the splash screen.
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.text.toPlainText().contains('CRM Agent'),
      ),
      findsOneWidget,
    );
    expect(find.text('Connecting you to your leads'), findsOneWidget);

    // 2. Pump the timer forward (3 seconds) to trigger the BLoC navigation event.
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // 3. Verify that we have navigated to the Login Screen.
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.text('Sign in to your agent account'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });

  testWidgets('Validation error messages are displayed properly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
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

  testWidgets(
    'Successful login routes to Dashboard Screen and renders components',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      // 1. Enter valid credentials
      await tester.enterText(
        find.bySemanticsLabel('Phone Number Input Field'),
        '9876543210',
      );
      await tester.enterText(
        find.bySemanticsLabel('Password Input Field'),
        'secure123',
      );

      // 2. Click Sign In and verify navigation
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();
      expect(find.byType(DashboardScreen), findsOneWidget);

      // 3. Resolve latency and check components
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      expect(find.text('Dashboard'), findsNWidgets(2));
      expect(find.text('Checked in • 9:02 AM'), findsOneWidget);
      expect(find.text('Campaign'), findsOneWidget);
      expect(find.text('3 active'), findsOneWidget);
      expect(find.text('Deals'), findsOneWidget);
      expect(find.text('7 open'), findsOneWidget);
      expect(find.text('Analytics'), findsOneWidget);
      expect(find.text('64% conv.'), findsOneWidget);
      expect(find.text('Attendance'), findsOneWidget);
      expect(find.text('In today'), findsOneWidget);

      // Check list section titles
      expect(find.text('Follow-up calls'), findsOneWidget);
      expect(find.text('Tasks'), findsNWidgets(2));
    },
  );
}
