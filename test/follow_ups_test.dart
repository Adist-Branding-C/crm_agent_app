import 'package:crm_agent_app/screens/dashboard/dashboard_screen.dart';
import 'package:crm_agent_app/widgets/call_button.dart';
import 'package:crm_agent_app/screens/dashboard/widgets/follow_ups_list.dart';
import 'package:crm_agent_app/screens/follow_ups/follow_ups_screen.dart';
import 'package:crm_agent_app/screens/follow_ups/widgets/follow_up_item_card.dart';
import 'package:crm_agent_app/screens/enquiry_details/enquiry_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets('Follow-ups integration, layout, call and back navigation test', (
    WidgetTester tester,
  ) async {
    await signInMockUser(tester);
    expect(find.byType(DashboardScreen), findsOneWidget);

    await tester.tap(
      find.descendant(
        of: find.byType(FollowUpsList),
        matching: find.text('View all'),
      ),
    );
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    expect(find.byType(FollowUpsScreen), findsOneWidget);
    expect(find.text('Follow-ups'), findsOneWidget);
    expect(find.text('Vishnu Prasad'), findsOneWidget);

    // Scroll down to make upcoming items visible
    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pumpAndSettle();

    expect(find.text('Upcoming'), findsOneWidget);
    expect(find.text('Divya Raveendran'), findsOneWidget);

    final divyaCard = find.ancestor(
      of: find.text('Divya Raveendran'),
      matching: find.byType(FollowUpItemCard),
    );
    await tester.tap(
      find.descendant(of: divyaCard, matching: find.byType(CallButton)),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Call now'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Calling Divya Raveendran...'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.chevron_left_rounded));
    await tester.pumpAndSettle();

    expect(find.byType(DashboardScreen), findsOneWidget);
    expect(find.byType(FollowUpsScreen), findsNothing);
  });

  testWidgets(
    'Dashboard follow-up card name click navigates to Lead Enquiry Details',
    (WidgetTester tester) async {
      await signInMockUser(tester);
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Rahul Menon'));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      expect(find.byType(EnquiryDetailsScreen), findsOneWidget);
      expect(find.text('Rahul Menon'), findsOneWidget);
    },
  );
}
