import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crm_agent_app/data/datasources/auth_datasource.dart';
import 'package:crm_agent_app/data/datasources/auth_remote_datasource.dart';
import 'package:crm_agent_app/data/models/login_response_model.dart';
import 'package:crm_agent_app/data/repositories/session_repository_impl.dart';
import 'package:crm_agent_app/main.dart';

class ConfigurableAuthRemoteDataSource implements AuthRemoteDataSource {
  Future<LoginResponse> Function(String, String)? onLogin;
  @override
  Future<LoginResponse> login(String p, String pw) async =>
      onLogin != null ? onLogin!(p, pw) : throw const NetworkException();
}

void main() {
  late ConfigurableAuthRemoteDataSource remoteSource;

  setUp(() {
    remoteSource = ConfigurableAuthRemoteDataSource();
  });

  testWidgets('Invalid credentials shows error banner', (tester) async {
    remoteSource.onLogin = (p, pw) =>
        throw const InvalidCredentialsException('Invalid phone or password');
    await tester.pumpWidget(buildTestApp(remoteSource));
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

    expect(find.text('Invalid phone or password'), findsOneWidget);
  });

  testWidgets('Network failure shows network error banner', (tester) async {
    remoteSource.onLogin = (p, pw) => throw const NetworkException();
    await tester.pumpWidget(buildTestApp(remoteSource));
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

    expect(
      find.text('Network error. Please check your connection.'),
      findsOneWidget,
    );
  });
}

Widget buildTestApp(AuthRemoteDataSource remoteSource) {
  SharedPreferences.setMockInitialValues({});
  return MyApp(
    sessionRepository: SessionRepositoryImpl(
      authDataSource: AuthDataSourceImpl(),
      authRemoteDataSource: remoteSource,
    )..init(),
    scaleText: false,
  );
}
