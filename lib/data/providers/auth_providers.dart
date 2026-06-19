import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/auth_repository.dart';

List<RepositoryProvider> buildAuthProviders(AuthRepository authRepository) => [
  RepositoryProvider<AuthRepository>.value(value: authRepository),
];
