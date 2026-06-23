import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/auth_repository.dart';
import '../repositories/auth_repository_impl.dart';
import '../repositories/session_repository.dart';
import '../repositories/otp_repository.dart';
import '../repositories/otp_repository_impl.dart';
import '../repositories/password_repository.dart';
import '../repositories/password_repository_impl.dart';
import '../datasources/auth_datasource.dart';

List<RepositoryProvider> buildAuthProviders(
  AuthDataSource authDataSource,
  SessionRepository sessionRepository,
) => [
  RepositoryProvider<AuthRepository>(
    create: (_) => AuthRepositoryImpl(authDataSource: authDataSource),
  ),
  RepositoryProvider<SessionRepository>.value(value: sessionRepository),
  RepositoryProvider<OtpRepository>(
    create: (_) => OtpRepositoryImpl(),
  ),
  RepositoryProvider<PasswordRepository>(
    create: (_) => PasswordRepositoryImpl(),
  ),
];
