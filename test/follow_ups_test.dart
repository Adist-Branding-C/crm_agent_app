import 'package:crm_agent_app/main.dart';
import 'package:crm_agent_app/screens/dashboard/dashboard_screen.dart';
import 'package:crm_agent_app/widgets/call_button.dart';
import 'package:crm_agent_app/screens/dashboard/widgets/follow_ups_list.dart';
import 'package:crm_agent_app/screens/follow_ups/follow_ups_screen.dart';
import 'package:crm_agent_app/screens/follow_ups/widgets/follow_up_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Follow-ups integration, layout, call and back navigation test',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
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
      expect(find.text('5 due today'), findsOneWidget);

      expect(find.text('Overdue'), findsOneWidget);
      expect(find.text('Due Today'), findsOneWidget);

      expect(find.text('Vishnu Prasad'), findsOneWidget);
      expect(find.text('Rahul Menon'), findsOneWidget);

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
        find.descendant(
          of: divyaCard,
          matching: find.byType(CallButton),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Calling Divya Raveendran...'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.chevron_left_rounded));
      await tester.pumpAndSettle();

      expect(find.byType(DashboardScreen), findsOneWidget);
      expect(find.byType(FollowUpsScreen), findsNothing);
    },
  );
}
