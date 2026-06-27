import 'package:crm_agent_app/screens/search/search_screen.dart';
import 'package:crm_agent_app/screens/leads/widgets/lead_card.dart';
import 'package:crm_agent_app/screens/tasks/widgets/task_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets('Global Search Screen integration test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());
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

    // Navigate to Search Tab
    final bottomNav = find.byType(BottomNavigationBar);
    await tester.tap(
      find.descendant(of: bottomNav, matching: find.text('Search')),
    );
    await tester.pumpAndSettle();

    expect(find.byType(SearchScreen), findsOneWidget);
    expect(find.text('SUGGESTED LEADS'), findsOneWidget);

    // Toggle Task checkbox
    final checkbox = find.byType(TaskCheckbox).first;
    expect(tester.widget<TaskCheckbox>(checkbox).isChecked, isFalse);
    await tester.tap(checkbox);
    await tester.pumpAndSettle();
    expect(tester.widget<TaskCheckbox>(checkbox).isChecked, isTrue);

    // Search query "rahu"
    await tester.enterText(find.byType(TextField), 'rahu');
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();

    expect(find.text('3 results'), findsOneWidget);
    expect(find.text('LEADS'), findsOneWidget);
    expect(find.text('SPOTLIGHTS'), findsOneWidget);
    expect(find.text('FOLLOW-UPS'), findsOneWidget);
    expect(find.byType(LeadCard), findsOneWidget);

    // Clear search
    await tester.tap(find.byIcon(Icons.close_rounded));
    await tester.pumpAndSettle();

    expect(find.text('RECENT'), findsOneWidget);
    expect(find.text('rahu'), findsOneWidget);
  });
}
