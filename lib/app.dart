import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'app_providers.dart';
import 'bloc/attendance/attendance_bloc.dart';
import 'bloc/account/account_bloc.dart';
import 'bloc/tasks/tasks_bloc.dart';
import 'data/auth_state_notifier.dart';
import 'data/datasources/auth_datasource.dart';
import 'data/repositories/attendance_repository.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'data/repositories/account_repository.dart';
import 'data/repositories/tasks_repository.dart';
import 'router.dart';
import 'theme.dart';

class MyApp extends StatefulWidget {
  final AuthRepository? authRepository;
  const MyApp({super.key, this.authRepository});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthRepository _authRepository;
  final _authStateNotifier = AuthStateNotifier();
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _authRepository = widget.authRepository ??
        (AuthRepositoryImpl(authDataSource: AuthDataSourceImpl())..init().then((_) => _authStateNotifier.refresh()));
    _router = createRouter(_authRepository, _authStateNotifier);
  }

  @override
  void dispose() {
    _authStateNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: buildRepositoryProviders(authRepository: _authRepository),
      child: ChangeNotifierProvider<AuthStateNotifier>.value(
        value: _authStateNotifier,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (c) => AttendanceBloc(attendanceRepository: c.read())..add(const LoadAttendance())),
            BlocProvider(create: (c) => AccountBloc(accountRepository: c.read(), authRepository: c.read())..add(const LoadAccount())),
            BlocProvider(create: (c) => TasksBloc(tasksRepository: c.read())..add(const LoadTasks())),
          ],
          child: MaterialApp.router(
            title: 'CRM Agent App',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            routerConfig: _router,
          ),
        ),
      ),
    );
  }
}
