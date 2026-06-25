import 'package:crm_agent_app/screens/deals/deals_screen.dart';
import 'package:crm_agent_app/screens/enquiry_details/enquiry_details_screen.dart';
import 'package:crm_agent_app/screens/enquiry_details/widgets/add_deal_bottom_sheet.dart';
import 'package:crm_agent_app/theme.dart';
import 'package:crm_agent_app/screens/enquiry_details/widgets/fab_expanded_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets(
    'Enquiry Details Add Deal flow triggers bottom sheet and redirects to Deals Screen',
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

      await tester.tap(find.text('Rahul Menon'));
      await tester.pumpAndSettle();

      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      expect(find.byType(EnquiryDetailsScreen), findsOneWidget);

      final fabFinder = find.byType(FloatingActionButton);
      await tester.tap(fabFinder);
      await tester.pumpAndSettle();

      expect(find.byType(FabExpandedMenu), findsOneWidget);
      expect(find.text('Add Deal'), findsOneWidget);

      await tester.tap(find.text('Add Deal'));
      await tester.pumpAndSettle();

      expect(find.text('New Deal'), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(AddDealBottomSheet),
          matching: find.text('Rahul Menon'),
        ),
        findsOneWidget,
      );

      final amountField = find.byType(TextFormField).last;
      await tester.enterText(amountField, '95000');
      await tester.pumpAndSettle();

      final submitButton = find.byType(ElevatedButton);
      expect(tester.widget<ElevatedButton>(submitButton).enabled, isTrue);
      await tester.tap(submitButton);
      await tester.pumpAndSettle();

      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      expect(find.byType(DealsScreen), findsOneWidget);
      expect(find.text('New Admission — Rahul — Rahul Menon'), findsOneWidget);
    },
  );
}
