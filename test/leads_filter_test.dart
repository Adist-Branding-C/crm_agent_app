import 'package:crm_agent_app/screens/leads/leads_screen.dart';
import 'package:crm_agent_app/screens/leads/widgets/filter_sheet.dart';
import 'package:crm_agent_app/screens/leads/widgets/lead_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets('Leads Filter Sheet options and sorting smoke test', (
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

    // Navigate to Leads Screen
    await tester.tap(find.byIcon(Icons.people_outline_rounded));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    // Verify Leads screen is loaded
    expect(find.byType(LeadsScreen), findsOneWidget);

    // 1. Open Filter Bottom Sheet
    await tester.tap(find.byIcon(Icons.tune_rounded));
    await tester.pumpAndSettle();

    // Verify Filter Sheet elements
    expect(find.byType(FilterSheet), findsOneWidget);
    expect(find.text('Filter & Sort'), findsOneWidget);
    expect(find.text('SORT BY'), findsOneWidget);
    expect(find.text('STATUS'), findsOneWidget);
    expect(find.text('SOURCE'), findsOneWidget);

    // 2. Select Sorting A-Z, Status: Interested, Source: Facebook
    await tester.tap(find.text('A-Z'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Interested'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Facebook'));
    await tester.pumpAndSettle();

    // 3. Apply Filters
    await tester.tap(find.text('Apply Filters'));
    await tester.pumpAndSettle();

    // Verify sheet closed
    expect(find.byType(FilterSheet), findsNothing);

    // Verify filtered and sorted items (Anjali Suresh and Rahul Menon)
    // Anjali Suresh should appear first because of alphabetical sort A-Z
    expect(find.byType(LeadCard), findsNWidgets(2));
    final firstCard = tester.widget<LeadCard>(find.byType(LeadCard).first);
    expect(firstCard.lead.name, 'Anjali Suresh');
  });
}
