import 'package:crm_agent_app/screens/tasks/tasks_screen.dart';
import 'package:crm_agent_app/screens/tasks/widgets/task_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets('Tasks Screen integration, toggling, and filtering test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // Login
    await tester.enterText(
        find.bySemanticsLabel('Phone Number Input Field'), '9876543210');
    await tester.enterText(
        find.bySemanticsLabel('Password Input Field'), 'secure123');
    await tester.tap(find.text('Sign In'));
    await tester.pumpAndSettle();

    // 1. Navigate via bottom navigation bar
    final bottomNav = find.byType(BottomNavigationBar);
    await tester.tap(
        find.descendant(of: bottomNav, matching: find.text('Tasks')));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.byType(TasksScreen), findsOneWidget);
    expect(find.text('6 pending · 2 overdue'), findsOneWidget);
    expect(find.text('Prepare project proposal'), findsOneWidget);

    // 2. Toggle Task Completion
    final firstCheckbox = find.byType(TaskCheckbox).first;
    await tester.tap(firstCheckbox);
    await tester.pumpAndSettle();
    expect(find.text('5 pending · 2 overdue'), findsOneWidget);

    // 3. Filter tabs
    await tester.tap(find.text('Completed'));
    await tester.pumpAndSettle();
    expect(find.text('Quarterly review prep'), findsOneWidget);
    expect(find.text('Campus visit — Aravind Krishnan'), findsNothing);

    // 4. Return to Dashboard and test "View all"
    await tester.tap(
        find.descendant(of: bottomNav, matching: find.text('Dashboard')));
    await tester.pumpAndSettle();
    expect(find.byType(TasksScreen), findsNothing);

    // Scroll dashboard to bring TasksList's View all into view
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -400));
    await tester.pumpAndSettle();

    await tester.tap(find.text('View all').last);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.byType(TasksScreen), findsOneWidget);
  });
}
