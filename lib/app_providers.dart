import 'package:provider/single_child_widget.dart';
import 'data/providers/activity_providers.dart';
import 'data/providers/auth_providers.dart';
import 'data/providers/domain_providers.dart';
import 'data/providers/lead_providers.dart';
import 'data/datasources/auth_datasource.dart';
import 'data/repositories/session_repository.dart';

List<SingleChildWidget> buildRepositoryProviders({
  required AuthDataSource authDataSource,
  required SessionRepository sessionRepository,
}) => [
  ...buildAuthProviders(authDataSource, sessionRepository),
  ...buildLeadProviders(),
  ...buildActivityProviders(),
  ...buildDomainProviders(),
];
