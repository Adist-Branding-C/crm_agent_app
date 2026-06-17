import 'package:crm_agent_app/screens/enquiry_details/enquiry_details_screen.dart';
import 'package:crm_agent_app/screens/call_log/call_log_screen.dart';
import 'package:crm_agent_app/screens/enquiry_details/widgets/fab_expanded_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets(
    'Enquiry Details FAB menu has Add Call Log option and navigates to CallLogScreen',
    (WidgetTester tester) async {
      await tester.pumpWidget(createTestApp());
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

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

      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      // Tap on Rahul Menon to navigate to Enquiry Details screen
      await tester.tap(find.text('Call back Rahul Menon'));
      await tester.pumpAndSettle();

      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      expect(find.byType(EnquiryDetailsScreen), findsOneWidget);

      // Verify the FAB is visible (starts closed, showing plus icon)
      final fabFinder = find.byType(FloatingActionButton);
      expect(fabFinder, findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);

      // Tap FAB to open menu
      await tester.tap(fabFinder);
      await tester.pumpAndSettle();

      // Verify menu expanded
      expect(find.byType(FabExpandedMenu), findsOneWidget);
      expect(find.text('Add Call Log'), findsOneWidget);
      expect(find.byIcon(Icons.phone_callback), findsOneWidget);

      // Tap 'Add Call Log'
      await tester.tap(find.text('Add Call Log'));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      // Verify navigated to Call Log screen
      expect(find.byType(CallLogScreen), findsOneWidget);
      expect(find.text('Log Call'), findsOneWidget);
      expect(find.text('Rahul Menon'), findsOneWidget);
    },
  );
}
