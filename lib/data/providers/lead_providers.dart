import 'package:provider/provider.dart';
import '../datasources/leads_datasource.dart';
import '../repositories/leads_repository.dart';
import '../repositories/leads_repository_impl.dart';

List<dynamic> buildLeadProviders() {
  final ds = LeadsDataSourceImpl();
  return [
    Provider<LeadsRepository>(
      create: (_) => LeadsRepositoryImpl(leadsDataSource: ds),
      dispose: (_, repo) => repo.dispose(),
    ),
  ];
}
