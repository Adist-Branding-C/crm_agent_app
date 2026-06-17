import 'package:crm_agent_app/screens/dashboard/dashboard_screen.dart';
import 'package:crm_agent_app/screens/campaigns/campaigns_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets('Campaigns Screen navigation and list smoke test', (
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

    // 2. Click the Campaign stats card in the grid
    await tester.tap(find.text('Campaign'));
    await tester.pumpAndSettle();

    // Settle BLoC loading delay
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();

    // Verify Campaigns screen components are rendered
    expect(find.byType(CampaignsScreen), findsOneWidget);
    expect(find.text('Campaigns'), findsOneWidget);
    expect(find.text('4 active'), findsOneWidget);

    // Verify initial campaign cards are shown
    expect(find.text('May Admission Drive'), findsOneWidget);
    expect(find.text('Onam Early Bird Offer'), findsOneWidget);
    expect(find.text('Re-engage Cold Leads'), findsOneWidget);
    expect(find.text('Demo Follow-up Blast'), findsOneWidget);

    // 3. Test back button functionality
    await tester.tap(find.byIcon(Icons.chevron_left_rounded));
    await tester.pumpAndSettle();

    // Verify we are back on the Dashboard
    expect(find.byType(DashboardScreen), findsOneWidget);
    expect(find.byType(CampaignsScreen), findsNothing);
  });
}
