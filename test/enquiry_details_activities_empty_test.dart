import 'package:crm_agent_app/screens/enquiry_details/enquiry_details_screen.dart';
import 'package:crm_agent_app/screens/enquiry_details/widgets/activities_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets(
    'Enquiry Details Activities tab shows beautiful empty state when no activities exist',
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

      // 3. Find and tap 'Activities' tab
      final activitiesTabFinder = find.text('Activities');
      expect(activitiesTabFinder, findsOneWidget);
      await tester.tap(activitiesTabFinder);
      await tester.pumpAndSettle();

      // 4. Verify ActivitiesTabView is displayed and empty state elements are present
      expect(find.byType(ActivitiesTabView), findsOneWidget);
      expect(find.text('No Activities Yet'), findsOneWidget);
      expect(
        find.text('Activities related to this enquiry will show up here.'),
        findsOneWidget,
      );
      expect(find.byIcon(Icons.history), findsOneWidget);
    },
  );
}
