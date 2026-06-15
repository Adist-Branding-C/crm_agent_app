import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'data/auth_state_notifier.dart';
import 'data/datasources/auth_datasource.dart';
import 'data/datasources/leads_datasource.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/leads_repository.dart';
import 'data/repositories/analytics_repository.dart';
import 'data/repositories/attendance_repository.dart';
import 'data/repositories/campaigns_repository.dart';
import 'data/repositories/dashboard_repository.dart';
import 'data/repositories/deals_repository.dart';
import 'data/repositories/deals_repository_impl.dart';
import 'data/repositories/tasks_repository.dart';
import 'data/repositories/tasks_repository_impl.dart';
import 'data/repositories/account_repository.dart';
import 'router.dart';
import 'theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthRepository _authRepository = AuthRepositoryImpl(authDataSource: AuthDataSourceImpl());
  late final AuthStateNotifier _authStateNotifier = AuthStateNotifier();
  late final LeadsRepository _leadsRepository = LeadsRepositoryImpl(leadsDataSource: LeadsDataSourceImpl());
  late final AnalyticsRepository _analyticsRepository = AnalyticsRepositoryImpl();
  late final AttendanceRepository _attendanceRepository = AttendanceRepositoryImpl();
  late final CampaignsRepository _campaignsRepository = CampaignsRepositoryImpl();
  late final DashboardRepository _dashboardRepository = DashboardRepositoryImpl();
  late final DealsRepository _dealsRepository = DealsRepositoryImpl();
  late final TasksRepository _tasksRepository = TasksRepositoryImpl();
  late final AccountRepository _accountRepository = AccountRepositoryImpl();
  late final GoRouter _router = createRouter(_authRepository, _authStateNotifier);

  @override
  void dispose() {
    _authStateNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>(create: (_) => _authRepository),
          RepositoryProvider<LeadsRepository>(create: (_) => _leadsRepository),
          RepositoryProvider<AnalyticsRepository>(create: (_) => _analyticsRepository),
          RepositoryProvider<AttendanceRepository>(create: (_) => _attendanceRepository),
          RepositoryProvider<CampaignsRepository>(create: (_) => _campaignsRepository),
          RepositoryProvider<DashboardRepository>(create: (_) => _dashboardRepository),
          RepositoryProvider<DealsRepository>(create: (_) => _dealsRepository),
          RepositoryProvider<TasksRepository>(create: (_) => _tasksRepository),
          RepositoryProvider<AccountRepository>(create: (_) => _accountRepository),
        ],
        child: ChangeNotifierProvider<AuthStateNotifier>.value(
          value: _authStateNotifier,
          child: MaterialApp.router(
            title: 'CRM Agent App',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            routerConfig: _router,
          ),
        ),
      );
}
