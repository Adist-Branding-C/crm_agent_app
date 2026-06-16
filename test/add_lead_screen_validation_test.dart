import 'package:crm_agent_app/screens/leads/add_lead_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets(
    'Add Lead Screen real-time validation warnings test',
    (WidgetTester tester) async {
      await signInMockUser(tester);
      await tester.tap(find.byIcon(Icons.people_outline_rounded));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpAndSettle();

      // Click "Plus" button to navigate to Add Lead screen
      await tester.tap(find.byIcon(Icons.add_rounded));
      await tester.pumpAndSettle();
      expect(find.byType(AddLeadScreen), findsOneWidget);

      // Verify Save Lead button is disabled initially
      final saveButtonFinder = find.widgetWithText(ElevatedButton, 'Save Lead');
      ElevatedButton button = tester.widget<ElevatedButton>(saveButtonFinder);
      expect(button.enabled, false);

      // Enter invalid entries to trigger validation warnings
      await tester.enterText(find.bySemanticsLabel('Full Name Input Field'), 'Jo');
      await tester.enterText(find.bySemanticsLabel('Phone Input Field'), '12345');
      await tester.enterText(find.bySemanticsLabel('Email Input Field'), 'alice@com');
      await tester.pumpAndSettle();

      expect(
        find.text('Please enter a valid name (alphabets only, minimum 3 characters).'),
        findsOneWidget,
      );
      expect(
        find.text('Please enter a valid 10-digit phone number.'),
        findsOneWidget,
      );
      expect(
        find.text('Please enter a valid email address (e.g., example@domain.com).'),
        findsOneWidget,
      );
    },
  );
}
