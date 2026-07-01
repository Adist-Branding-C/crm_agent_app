import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/data/datasources/auth_datasource.dart';
import 'package:crm_agent_app/data/datasources/auth_remote_datasource.dart';
import 'package:crm_agent_app/data/models/login_response_model.dart';
import 'package:crm_agent_app/data/repositories/session_repository_impl.dart';
import 'package:crm_agent_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<LoginResponse> login(String phone, String password) async {
    return const LoginResponse(
      success: true,
      message: 'Login successful',
      token: 'fake_jwt_token',
      user: LoginUser(phone: '1234567890', name: 'John Doe'),
    );
  }
}

Widget createTestApp() {
  SharedPreferences.setMockInitialValues({
    'settings_font_size': 'Medium',
    'settings_font_style': 'Outfit',
  });
  final dataSource = AuthDataSourceImpl();
  final remoteDataSource = FakeAuthRemoteDataSource();
  final repo = SessionRepositoryImpl(
    authDataSource: dataSource,
    authRemoteDataSource: remoteDataSource,
  );
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
  final buttonFinder = find.text('Sign In');
  await tester.ensureVisible(buttonFinder);
  await tester.tap(buttonFinder);
  await tester.pumpAndSettle();
}
