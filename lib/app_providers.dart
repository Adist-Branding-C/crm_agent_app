import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/providers/activity_providers.dart';
import 'data/providers/auth_providers.dart';
import 'data/providers/domain_providers.dart';
import 'data/providers/lead_providers.dart';
import 'data/repositories/auth_repository.dart';

List<RepositoryProvider> buildRepositoryProviders({
  required AuthRepository authRepository,
}) => [
  ...buildAuthProviders(authRepository),
  ...buildLeadProviders(),
  ...buildActivityProviders(),
  ...buildDomainProviders(),
];
