import 'package:crm_agent_app/main.dart';
import 'package:crm_agent_app/screens/dashboard/dashboard_screen.dart';
import 'package:crm_agent_app/screens/deals/deals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Deals Screen integration and view toggle test', (
    WidgetTester tester,
  ) async {
    // 1. Build the app and bypass splash
    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // Login
    await tester.enterText(
      find.bySemanticsLabel('Phone Number Input Field'),
      '9876543210',
    );
    await tester.enterText(
      find.bySemanticsLabel('Password Input Field'),
      'secure123',
    );
    await tester.tap(find.text('Sign In'));
    await tester.pumpAndSettle();
    expect(find.byType(DashboardScreen), findsOneWidget);

    // 2. Click the Deals stats card in the grid
    await tester.tap(find.text('Deals'));
    await tester.pumpAndSettle();

    // Settle BLoC loading delay
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pumpAndSettle();

    // Verify Deals screen components are rendered in Pipeline mode
    expect(find.byType(DealsScreen), findsOneWidget);
    expect(find.text('7 active · ₹7.88L pipeline'), findsOneWidget);
    expect(find.text('Pipeline value'), findsOneWidget);
    expect(find.text('Won this month'), findsOneWidget);

    // Verify some deal cards in Pipeline view
    expect(find.text('Crash Course — Anjali S.'), findsOneWidget);
    expect(find.text('Full Program — Aravind K.'), findsOneWidget);

    // 3. Switch to List view
    await tester.tap(find.text('List'));
    await tester.pumpAndSettle();

    // Verify List view contents
    expect(find.text('Close May 12'), findsOneWidget);
    expect(find.text('Close Apr 28'), findsOneWidget);

    // 4. Test back button functionality
    await tester.tap(find.byIcon(Icons.chevron_left_rounded));
    await tester.pumpAndSettle();

    // Verify we are back on the Dashboard
    expect(find.byType(DashboardScreen), findsOneWidget);
    expect(find.byType(DealsScreen), findsNothing);
  });
}
