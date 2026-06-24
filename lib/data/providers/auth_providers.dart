import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/session_repository.dart';
import '../repositories/otp_repository.dart';
import '../repositories/otp_repository_impl.dart';
import '../repositories/password_repository.dart';
import '../repositories/password_repository_impl.dart';
List<RepositoryProvider> buildAuthProviders(
  SessionRepository sessionRepository,
) => [
  RepositoryProvider<SessionRepository>.value(value: sessionRepository),
  RepositoryProvider<OtpRepository>(
    create: (_) => OtpRepositoryImpl(),
  ),
  RepositoryProvider<PasswordRepository>(
    create: (_) => PasswordRepositoryImpl(),
  ),
];
