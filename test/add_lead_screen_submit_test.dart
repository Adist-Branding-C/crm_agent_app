import 'package:crm_agent_app/screens/leads/add_lead_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets(
    'Add Lead Screen successful submission integration test',
    (WidgetTester tester) async {
      await signInMockUser(tester);
      await tester.tap(find.byIcon(Icons.people_outline_rounded));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add_rounded));
      await tester.pumpAndSettle();
      expect(find.byType(AddLeadScreen), findsOneWidget);

      await tester.enterText(find.bySemanticsLabel('Full Name Input Field'), 'Alice Wonderland');
      await tester.enterText(find.bySemanticsLabel('Phone Input Field'), '9123456789');
      await tester.enterText(find.bySemanticsLabel('Email Input Field'), 'alice@wonder.com');
      await tester.enterText(find.bySemanticsLabel('Location Input Field'), 'London');

      await tester.ensureVisible(find.text('Website'));
      await tester.tap(find.text('Website'));
      await tester.ensureVisible(find.text('Demo Request'));
      await tester.tap(find.text('Demo Request'));
      await tester.ensureVisible(find.text('Hot'));
      await tester.tap(find.text('Hot'));
      await tester.ensureVisible(find.text('Qualified'));
      await tester.tap(find.text('Qualified'));
      await tester.pumpAndSettle();

      final saveButtonFinder = find.widgetWithText(ElevatedButton, 'Save Lead');
      ElevatedButton button = tester.widget<ElevatedButton>(saveButtonFinder);
      expect(button.enabled, true);

      await tester.tap(saveButtonFinder);
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      expect(find.byType(AddLeadScreen), findsNothing);
      expect(find.text('Alice Wonderland'), findsOneWidget);
      expect(find.text('Demo Request · Qualified'), findsOneWidget);
    },
  );
}
