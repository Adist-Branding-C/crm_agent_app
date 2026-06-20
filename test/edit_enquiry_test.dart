import 'package:crm_agent_app/screens/enquiry_details/enquiry_details_screen.dart';
import 'package:crm_agent_app/screens/enquiry_details/edit_enquiry_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets(
    'Edit Enquiry flow opens dedicated page, validates required fields, and updates details',
    (WidgetTester tester) async {
      // 1. Sign in
      await signInMockUser(tester);
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      // 2. Navigate to Enquiry Details for Rahul Menon
      await tester.tap(find.text('Call back Rahul Menon'));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      expect(find.byType(EnquiryDetailsScreen), findsOneWidget);

      // 3. Find and tap Edit button
      final editBtn = find.text('Edit');
      expect(editBtn, findsOneWidget);
      await tester.tap(editBtn);
      await tester.pumpAndSettle();

      // 4. Verify Edit Enquiry Page is shown
      expect(find.byType(EditEnquiryScreen), findsOneWidget);
      expect(find.text('Full Name'), findsAtLeastNWidgets(1));

      // 5. Try clearing name to test validation
      final nameField = find.bySemanticsLabel('Full Name Input Field');
      await tester.enterText(nameField, '');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Save Changes'), warnIfMissed: false);
      await tester.pumpAndSettle();
      // Should show a snackbar/validation warning
      expect(find.text('Please fill all required fields'), findsAtLeastNWidgets(1));

      // 6. Enter a valid name and save changes
      await tester.enterText(nameField, 'Rahul Menon Updated');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Save Changes'), warnIfMissed: false);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      // 7. Verify the details screen is updated
      expect(find.text('Rahul Menon Updated'), findsOneWidget);
    },
  );
}
