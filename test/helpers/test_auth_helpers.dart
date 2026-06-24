import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/data/datasources/auth_datasource.dart';
import 'package:crm_agent_app/data/repositories/session_repository_impl.dart';
import 'package:crm_agent_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget createTestApp() {
  SharedPreferences.setMockInitialValues({});
  final dataSource = AuthDataSourceImpl();
  final repo = SessionRepositoryImpl(authDataSource: dataSource);
  repo.init();
  return MyApp(sessionRepository: repo, scaleText: false);
}

Future<void> signInMockUser(WidgetTester tester) async {
  await tester.pumpWidget(createTestApp());
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
