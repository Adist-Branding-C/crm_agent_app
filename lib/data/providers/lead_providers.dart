import 'package:flutter_bloc/flutter_bloc.dart';
import '../datasources/leads_datasource.dart';
import '../repositories/leads_repository.dart';
import '../repositories/leads_repository_impl.dart';

List<RepositoryProvider> buildLeadProviders() {
  final ds = LeadsDataSourceImpl();
  return [
    RepositoryProvider<LeadsRepository>(
      create: (_) => LeadsRepositoryImpl(leadsDataSource: ds),
    ),
  ];
}
