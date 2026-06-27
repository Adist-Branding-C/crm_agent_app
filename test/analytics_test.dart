import 'package:crm_agent_app/screens/dashboard/dashboard_screen.dart';
import 'package:crm_agent_app/screens/analytics/analytics_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets('Analytics Screen navigation and metrics test', (
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

    // Navigate to Analytics
    await tester.tap(find.text('Analytics'));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();

    // Verify Leads tab metrics & charts
    expect(find.byType(AnalyticsScreen), findsOneWidget);
    expect(find.text('10'), findsNWidgets(2));
    expect(find.text('Total leads'), findsOneWidget);
    expect(find.text('60%'), findsOneWidget);
    expect(find.text('Conversion'), findsOneWidget);
    expect(find.text('3'), findsNWidgets(2));
    expect(find.text('Interested'), findsNWidgets(2));
    expect(find.text('0'), findsNWidgets(2));
    expect(find.text('Lost'), findsNWidgets(2));

    // Test Filter Modal Sheet
    await tester.tap(find.text('Filter'));
    await tester.pumpAndSettle();
    expect(find.text('Filter analytics'), findsOneWidget);
    expect(find.text('DATE RANGE'), findsOneWidget);

    // Apply "This Quarter" filter
    final thisQuarter = find.text('This Quarter');
    await tester.ensureVisible(thisQuarter);
    await tester.pumpAndSettle();
    await tester.tap(thisQuarter);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Apply Filters'));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();

    // Verify filter title updated
    expect(find.text('This Quarter'), findsAtLeast(1));

    // Switch to Deals tab
    await tester.tap(find.text('Deals'));
    await tester.pumpAndSettle();

    // Verify Deals tab metrics & charts
    expect(find.text('₹7.23L'), findsOneWidget);
    expect(find.text('Open pipeline'), findsOneWidget);
    expect(find.text('1'), findsNWidgets(4));
    expect(find.text('Won deals'), findsOneWidget);
    expect(find.text('14%'), findsOneWidget);
    expect(find.text('Win rate'), findsOneWidget);
    expect(find.text('₹1.13L'), findsOneWidget);
    expect(find.text('Avg deal'), findsOneWidget);
    expect(find.text('Deals by stage'), findsOneWidget);
    expect(find.text('Pipeline value by stage'), findsOneWidget);
    expect(find.text('Value by deal type'), findsOneWidget);

    // Test back button
    await tester.tap(find.byIcon(Icons.chevron_left_rounded));
    await tester.pumpAndSettle();
    expect(find.byType(DashboardScreen), findsOneWidget);
  });
}
