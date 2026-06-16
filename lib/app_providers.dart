import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/datasources/leads_datasource.dart';
import 'data/repositories/account_repository.dart';
import 'data/repositories/analytics_repository.dart';
import 'data/repositories/attendance_repository.dart';
import 'data/repositories/attendance_repository_impl.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/campaigns_repository.dart';
import 'data/repositories/dashboard_repository.dart';
import 'data/repositories/deals_repository.dart';
import 'data/repositories/deals_repository_impl.dart';
import 'data/repositories/leads_repository.dart';
import 'data/repositories/leads_repository_impl.dart';
import 'data/repositories/tasks_repository.dart';
import 'data/repositories/tasks_repository_impl.dart';

/// Builds the list of repository providers for the app.
List<RepositoryProvider> buildRepositoryProviders({
  required AuthRepository authRepository,
}) {
  return [
    RepositoryProvider<AuthRepository>(
      create: (_) => authRepository,
    ),
    RepositoryProvider<LeadsRepository>(
      create: (_) => LeadsRepositoryImpl(
        leadsDataSource: LeadsDataSourceImpl(),
      ),
    ),
    RepositoryProvider<AnalyticsRepository>(
      create: (_) => AnalyticsRepositoryImpl(),
    ),
    RepositoryProvider<AttendanceRepository>(
      create: (_) => AttendanceRepositoryImpl(),
    ),
    RepositoryProvider<CampaignsRepository>(
      create: (_) => CampaignsRepositoryImpl(),
    ),
    RepositoryProvider<DashboardRepository>(
      create: (_) => DashboardRepositoryImpl(),
    ),
    RepositoryProvider<DealsRepository>(
      create: (_) => DealsRepositoryImpl(),
    ),
    RepositoryProvider<TasksRepository>(
      create: (_) => TasksRepositoryImpl(),
    ),
    RepositoryProvider<AccountRepository>(
      create: (_) => AccountRepositoryImpl(),
    ),
  ];
}
