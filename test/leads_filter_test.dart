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

  testWidgets('Filter Button active state visual indicator and Clear button functionality', (
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

    // 1. Verify initially the Filter button background is white or default
    final filterButtonFinder = find.ancestor(
      of: find.byIcon(Icons.tune_rounded),
      matching: find.byType(GestureDetector),
    );
    expect(filterButtonFinder, findsOneWidget);

    final containerFinder = find.descendant(
      of: filterButtonFinder,
      matching: find.byType(Container),
    );
    Container container = tester.widget<Container>(containerFinder.first);
    expect((container.decoration as BoxDecoration).color, Colors.white);

    // 2. Open Filter Sheet, verify "Clear" is NOT visible
    await tester.tap(find.byIcon(Icons.tune_rounded));
    await tester.pumpAndSettle();
    expect(find.text('Clear'), findsNothing);

    // 3. Select a filter (e.g., Status: Interested)
    await tester.tap(find.text('Interested'));
    await tester.pumpAndSettle();

    // Verify "Clear" is now visible
    expect(find.text('Clear'), findsOneWidget);

    // 4. Click "Clear" button in sheet
    await tester.tap(find.text('Clear'));
    await tester.pumpAndSettle();

    // Verify sheet closed and filter button background is still white
    expect(find.byType(FilterSheet), findsNothing);
    container = tester.widget<Container>(containerFinder.first);
    expect((container.decoration as BoxDecoration).color, Colors.white);

    // 5. Open Filter Sheet again, apply a filter
    await tester.tap(find.byIcon(Icons.tune_rounded));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Interested'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Apply Filters'));
    await tester.pumpAndSettle();

    // Verify filter button background is primary color (brand red)
    container = tester.widget<Container>(containerFinder.first);
    expect((container.decoration as BoxDecoration).color, const Color(0xFFE53935));

    // 6. Open Filter Sheet, click "Clear" to clear active filter
    await tester.tap(find.byIcon(Icons.tune_rounded));
    await tester.pumpAndSettle();
    expect(find.text('Clear'), findsOneWidget);
    await tester.tap(find.text('Clear'));
    await tester.pumpAndSettle();

    // Verify filter button background is white again
    container = tester.widget<Container>(containerFinder.first);
    expect((container.decoration as BoxDecoration).color, Colors.white);
  });
}
