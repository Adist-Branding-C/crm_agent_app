import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/widgets/user_avatar.dart';
import 'package:crm_agent_app/screens/attendance_history/attendance_history_screen.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets('Attendance History flow and tab toggle test', (tester) async {
    await signInMockUser(tester);
    await tester.pumpAndSettle();

    // 1. Go to Profile screen
    expect(find.byType(UserAvatar), findsOneWidget);
    await tester.tap(find.byType(UserAvatar));
    await tester.pumpAndSettle();
    expect(find.text('Profile'), findsOneWidget);

    // 2. Navigate to Attendance History
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -300));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Attendance History'));
    await tester.pumpAndSettle();

    // Wait for BLoC load duration
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();

    // 3. Verify screen components
    expect(find.byType(AttendanceHistoryScreen), findsOneWidget);
    expect(find.text('Attendance History'), findsOneWidget);
    expect(find.text('8 of 9 working days'), findsOneWidget);
    expect(find.text('86%'), findsOneWidget); // On time percentage
    expect(find.text('6 casual leaves left'), findsOneWidget);

    // 4. Verify selected day card
    expect(find.text('TUE, 12 May'), findsOneWidget);
    expect(find.text('Check in'), findsWidgets); // From both cards/legend
    expect(find.text('9:02 AM'), findsWidgets);

    // 5. Test tab switching: Calendar to Log
    await tester.tap(find.text('Log'));
    await tester.pumpAndSettle();
    expect(find.text('Daily log'), findsOneWidget);
    expect(find.text('9h 38m'), findsOneWidget); // Mon 11 log hours

    // 6. Test calendar tab and selecting a day
    await tester.tap(find.text('Calendar'));
    await tester.pumpAndSettle();
    expect(find.text('TUE, 12 May'), findsOneWidget); // selected default

    // Scroll calendar grid into view
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -300));
    await tester.pumpAndSettle();

    // Tap day 11 cell
    await tester.tap(find.text('11'));
    await tester.pumpAndSettle();
    expect(find.text('MON, 11 May'), findsOneWidget);
    expect(find.text('6:38 PM'), findsOneWidget);

    // 7. Test back navigation
    await tester.tap(find.byIcon(Icons.chevron_left_rounded));
    await tester.pumpAndSettle();
    expect(find.text('Profile'), findsOneWidget);
  });
}
