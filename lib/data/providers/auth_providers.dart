import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/auth_repository.dart';
import '../repositories/session_repository.dart';
import '../repositories/otp_repository.dart';
import '../repositories/password_repository.dart';

List<RepositoryProvider> buildAuthProviders(AuthRepository authRepository) => [
  RepositoryProvider<AuthRepository>.value(value: authRepository),
  RepositoryProvider<SessionRepository>.value(value: authRepository),
  RepositoryProvider<OtpRepository>.value(value: authRepository),
  RepositoryProvider<PasswordRepository>.value(value: authRepository),
];
