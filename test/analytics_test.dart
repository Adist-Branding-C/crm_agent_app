import 'package:crm_agent_app/screens/dashboard/dashboard_screen.dart';
import 'package:crm_agent_app/screens/analytics/analytics_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets('Analytics Screen navigation and metrics smoke test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());
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

    // 2. Click the Analytics card in the dashboard grid
    await tester.tap(find.text('Analytics'));
    await tester.pumpAndSettle();

    // Settle BLoC loading delay
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();

    // Verify Analytics screen components are rendered
    expect(find.byType(AnalyticsScreen), findsOneWidget);
    expect(find.text('Analytics'), findsOneWidget);
    expect(find.text('This month'), findsOneWidget);

    // Verify summary metric cards
    expect(find.text('312'), findsOneWidget);
    expect(find.text('Total leads'), findsOneWidget);
    expect(find.text('64%'), findsOneWidget);
    expect(find.text('Conversion'), findsOneWidget);
    expect(find.text('11'), findsOneWidget);
    expect(find.text('Won deals'), findsOneWidget);
    expect(find.text('₹18.40L'), findsOneWidget);
    expect(find.text('Pipeline'), findsOneWidget);

    // Verify sections are visible
    expect(find.text('Leads by status'), findsOneWidget);
    expect(find.text('Leads by source'), findsOneWidget);

    // 3. Test back button functionality
    await tester.tap(find.byIcon(Icons.chevron_left_rounded));
    await tester.pumpAndSettle();

    // Verify we are back on the Dashboard
    expect(find.byType(DashboardScreen), findsOneWidget);
    expect(find.byType(AnalyticsScreen), findsNothing);
  });
}
