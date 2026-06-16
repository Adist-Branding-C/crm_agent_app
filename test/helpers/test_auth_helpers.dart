import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/main.dart';

/// Signs in a mock user inside integration tests, resolving splash delay.
Future<void> signInMockUser(WidgetTester tester) async {
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
}
