import 'package:crm_agent_app/screens/dashboard/dashboard_screen.dart';
import 'package:crm_agent_app/screens/leads/leads_screen.dart';
import 'package:crm_agent_app/screens/leads/widgets/leads_filter_tabs.dart';
import 'package:crm_agent_app/screens/leads/widgets/leads_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'helpers/test_auth_helpers.dart';

void main() {
  testWidgets('Leads Screen navigation and filter/search smoke test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // Login
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

    // 2. Click the Leads tab (index 1) in BottomNavigationBar
    await tester.tap(find.byIcon(Icons.people_outline_rounded));
    await tester.pumpAndSettle();

    // Settle BLoC loading delay
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    // Verify Leads screen components are rendered
    expect(find.byType(LeadsScreen), findsOneWidget);
    expect(find.text('My Leads'), findsOneWidget);
    expect(find.text('10 total · 4 hot'), findsOneWidget);
    expect(find.byType(LeadsSearchBar), findsOneWidget);
    expect(find.byType(LeadsFilterTabs), findsOneWidget);

    // Verify initial lead cards are shown
    expect(find.text('Gautham Krishna'), findsOneWidget);
    expect(find.text('Sandeep Kumar'), findsOneWidget);

    // 3. Test Search bar filter
    await tester.enterText(find.byType(TextField), 'Gautham');
    await tester.pumpAndSettle();
    expect(find.text('Gautham Krishna'), findsOneWidget);
    expect(find.text('Sandeep Kumar'), findsNothing);

    // Clear search
    await tester.enterText(find.byType(TextField), '');
    await tester.pumpAndSettle();

    // 4. Test Category Filter Tab
    await tester.tap(find.text('Hot · 4'));
    await tester.pumpAndSettle();
    expect(find.text('Gautham Krishna'), findsOneWidget);
    expect(find.text('Sandeep Kumar'), findsNothing);

    // Reset tab to All
    await tester.tap(find.text('All · 10'));
    await tester.pumpAndSettle();

    // 5. Test Spotlight filter (fire icon)
    await tester.tap(find.byIcon(Icons.whatshot_rounded));
    await tester.pumpAndSettle();
    expect(find.text('Gautham Krishna'), findsOneWidget);
    expect(find.text('Sandeep Kumar'), findsNothing);
    expect(find.text('Spotlights'), findsOneWidget);
    expect(find.text('My Leads'), findsNothing);

    // Toggle spotlight off
    await tester.tap(find.byIcon(Icons.whatshot_rounded));
    await tester.pumpAndSettle();
    expect(find.text('My Leads'), findsOneWidget);
    expect(find.text('Spotlights'), findsNothing);
  });
}
