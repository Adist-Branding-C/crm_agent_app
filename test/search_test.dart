import 'package:crm_agent_app/main.dart';
import 'package:crm_agent_app/screens/search/search_screen.dart';
import 'package:crm_agent_app/screens/leads/widgets/lead_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Global Search Screen integration test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Login
    await tester.enterText(
        find.bySemanticsLabel('Phone Number Input Field'), '9876543210');
    await tester.enterText(
        find.bySemanticsLabel('Password Input Field'), 'secure123');
    await tester.tap(find.text('Sign In'));
    await tester.pumpAndSettle();

    // Navigate to Search Tab
    final bottomNav = find.byType(BottomNavigationBar);
    await tester.tap(
        find.descendant(of: bottomNav, matching: find.text('Search')));
    await tester.pumpAndSettle();

    expect(find.byType(SearchScreen), findsOneWidget);
    expect(find.text('RECENT'), findsOneWidget);
    expect(find.text('Rahul Menon'), findsOneWidget);

    // Search query "rahu"
    await tester.enterText(find.byType(TextField), 'rahu');
    // Debounce wait
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();

    // Verify search results
    expect(find.text('2 results'), findsOneWidget);
    expect(find.text('LEADS'), findsOneWidget);
    expect(find.text('SPOTLIGHTS'), findsOneWidget);
    expect(find.byType(LeadCard), findsOneWidget);

    // Clear search
    await tester.tap(find.byIcon(Icons.close_rounded));
    await tester.pumpAndSettle();

    expect(find.text('RECENT'), findsOneWidget);
  });
}
