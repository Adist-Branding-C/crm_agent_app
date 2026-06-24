import 'package:provider/single_child_widget.dart';
import 'data/providers/activity_providers.dart';
import 'data/providers/auth_providers.dart';
import 'data/providers/domain_providers.dart';
import 'data/providers/lead_providers.dart';
import 'data/repositories/session_repository.dart';

List<SingleChildWidget> buildRepositoryProviders({
  required SessionRepository sessionRepository,
}) => [
  ...buildAuthProviders(sessionRepository),
  ...buildLeadProviders(),
  ...buildActivityProviders(),
  ...buildDomainProviders(),
];
