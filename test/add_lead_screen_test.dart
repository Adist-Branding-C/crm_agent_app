import 'package:crm_agent_app/main.dart';
import 'package:crm_agent_app/screens/leads/add_lead_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Add Lead Page BLoC real-time validation and submission integration test',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      // Login and navigate to Leads tab
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
      await tester.tap(find.byIcon(Icons.people_outline_rounded));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 300));
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
      await tester.enterText(
        find.bySemanticsLabel('Full Name Input Field'),
        'Jo',
      );
      await tester.enterText(
        find.bySemanticsLabel('Phone Input Field'),
        '12345',
      );
      await tester.enterText(
        find.bySemanticsLabel('Email Input Field'),
        'alice@com',
      );
      await tester.pumpAndSettle();

      expect(
        find.text(
          'Please enter a valid name (alphabets only, minimum 3 characters).',
        ),
        findsOneWidget,
      );
      expect(
        find.text('Please enter a valid 10-digit phone number.'),
        findsOneWidget,
      );
      expect(
        find.text(
          'Please enter a valid email address (e.g., example@domain.com).',
        ),
        findsOneWidget,
      );

      // Enter valid entries
      await tester.enterText(
        find.bySemanticsLabel('Full Name Input Field'),
        'Alice Wonderland',
      );
      await tester.enterText(
        find.bySemanticsLabel('Phone Input Field'),
        '9123456789',
      );
      await tester.enterText(
        find.bySemanticsLabel('Email Input Field'),
        'alice@wonder.com',
      );
      await tester.enterText(
        find.bySemanticsLabel('Location Input Field'),
        'London',
      );

      // Select chip options
      final websiteFinder = find.text('Website');
      await tester.ensureVisible(websiteFinder);
      await tester.tap(websiteFinder);

      final demoRequestFinder = find.text('Demo Request');
      await tester.ensureVisible(demoRequestFinder);
      await tester.tap(demoRequestFinder);

      final hotFinder = find.text('Hot');
      await tester.ensureVisible(hotFinder);
      await tester.tap(hotFinder);

      final qualifiedFinder = find.text('Qualified');
      await tester.ensureVisible(qualifiedFinder);
      await tester.tap(qualifiedFinder);
      await tester.pumpAndSettle();

      // Verify Save Lead button is now enabled
      button = tester.widget<ElevatedButton>(saveButtonFinder);
      expect(button.enabled, true);

      await tester.tap(saveButtonFinder);
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      // Verify back on leads list screen and the new lead is visible
      expect(find.byType(AddLeadScreen), findsNothing);
      expect(find.text('Alice Wonderland'), findsOneWidget);
      expect(find.text('Demo Request · Qualified'), findsOneWidget);
    },
  );
}
