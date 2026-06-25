import 'package:crm_agent_app/screens/enquiry_details/enquiry_details_screen.dart';
import 'package:crm_agent_app/screens/enquiry_details/widgets/notes_history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets(
    'Enquiry Details Notes tab shows beautiful empty state when no notes exist',
    (WidgetTester tester) async {
      // 1. Sign in
      await signInMockUser(tester);
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      // 2. Navigate to Enquiry Details for Rahul Menon
      await tester.tap(find.text('Rahul Menon'));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      expect(find.byType(EnquiryDetailsScreen), findsOneWidget);

      // 3. Find and tap 'Notes' tab
      final notesTabFinder = find.text('Notes');
      expect(notesTabFinder, findsOneWidget);
      await tester.tap(notesTabFinder);
      await tester.pumpAndSettle();

      // 4. Verify NotesHistoryList is displayed and empty state elements are present
      expect(find.byType(NotesHistoryList), findsOneWidget);
      expect(find.text('No notes yet'), findsOneWidget);
      expect(
        find.text('Log your first note for this enquiry.'),
        findsOneWidget,
      );
      expect(find.byIcon(Icons.description_outlined), findsOneWidget);
    },
  );
}
