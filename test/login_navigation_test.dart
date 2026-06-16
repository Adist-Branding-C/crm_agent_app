import 'package:crm_agent_app/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets(
    'Successful login routes to Dashboard Screen and renders components',
    (WidgetTester tester) async {
      await signInMockUser(tester);
      expect(find.byType(DashboardScreen), findsOneWidget);

      // Resolve latency and check components
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      expect(find.text('Dashboard'), findsNWidgets(2));
      expect(find.text('Checked in • 9:02 AM'), findsOneWidget);
      expect(find.text('Campaign'), findsOneWidget);
      expect(find.text('3 active'), findsOneWidget);
      expect(find.text('Deals'), findsOneWidget);
      expect(find.text('7 open'), findsOneWidget);
      expect(find.text('Analytics'), findsOneWidget);
      expect(find.text('64% conv.'), findsOneWidget);
      expect(find.text('Attendance'), findsOneWidget);
      expect(find.text('In today'), findsOneWidget);

      // Check list section titles
      expect(find.text('Follow-up calls'), findsOneWidget);
      expect(find.text('Tasks'), findsNWidgets(2));
    },
  );
}
