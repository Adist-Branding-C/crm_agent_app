import 'package:crm_agent_app/screens/login/login_screen.dart';
import 'package:crm_agent_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets('Splash Screen flow and navigation smoke test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());
    await tester.pump();

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
}
