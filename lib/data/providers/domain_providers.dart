import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/analytics_repository.dart';
import '../repositories/analytics_repository_impl.dart';
import '../repositories/attendance_repository.dart';
import '../repositories/attendance_repository_impl.dart';
import '../repositories/campaigns_repository.dart';
import '../repositories/campaigns_repository_impl.dart';
import '../repositories/dashboard_repository.dart';
import '../repositories/dashboard_repository_impl.dart';
import '../repositories/deals_repository.dart';
import '../repositories/deals_repository_impl.dart';
import '../repositories/tasks_repository.dart';
import '../repositories/tasks_repository_impl.dart';
import '../repositories/spotlight_repository.dart';
import '../repositories/spotlight_repository_impl.dart';
import '../repositories/follow_ups_repository.dart';
import '../repositories/follow_ups_repository_impl.dart';
import '../repositories/notifications_repository.dart';
import '../repositories/notifications_repository_impl.dart';
import '../repositories/account_repository.dart';
import '../repositories/account_repository_impl.dart';
import '../repositories/leads_repository.dart';

List<RepositoryProvider> buildDomainProviders() => [
  RepositoryProvider<DealsRepository>(create: (_) => DealsRepositoryImpl()),
  RepositoryProvider<AnalyticsRepository>(
    create: (context) => AnalyticsRepositoryImpl(
      leadsRepository: context.read<LeadsRepository>(),
      dealsRepository: context.read<DealsRepository>(),
    ),
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
  RepositoryProvider<TasksRepository>(create: (_) => TasksRepositoryImpl()),
  RepositoryProvider<SpotlightRepository>(
    create: (_) => SpotlightRepositoryImpl(),
  ),
  RepositoryProvider<FollowUpsRepository>(
    create: (_) => FollowUpsRepositoryImpl(),
  ),
  RepositoryProvider<AccountRepository>(create: (_) => AccountRepositoryImpl()),
  RepositoryProvider<NotificationsRepository>(
    create: (_) => NotificationsRepositoryImpl(),
  ),
];
