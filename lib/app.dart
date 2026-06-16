import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'app_providers.dart';
import 'bloc/attendance/attendance_bloc.dart';
import 'bloc/account/account_bloc.dart';
import 'data/auth_state_notifier.dart';
import 'data/datasources/auth_datasource.dart';
import 'data/repositories/attendance_repository.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'data/repositories/account_repository.dart';
import 'router.dart';
import 'theme.dart';


/// The root application widget.
class MyApp extends StatefulWidget {
  const MyApp({super.key, this.authRepository});
  final AuthRepository? authRepository;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthRepository _authRepository;
  late final AuthStateNotifier _authStateNotifier = AuthStateNotifier();
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    if (widget.authRepository != null) {
      _authRepository = widget.authRepository!;
    } else {
      final repo = AuthRepositoryImpl(authDataSource: AuthDataSourceImpl());
      _authRepository = repo;
      repo.init().then((_) {
        _authStateNotifier.refresh();
      });
    }
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
            BlocProvider<AttendanceBloc>(
              create: (c) => AttendanceBloc(
                attendanceRepository: c.read<AttendanceRepository>(),
              )..add(const LoadAttendance()),
            ),
            BlocProvider<AccountBloc>(
              create: (c) => AccountBloc(
                accountRepository: c.read<AccountRepository>(),
                authRepository: c.read<AuthRepository>(),
              )..add(const LoadAccount()),
            ),
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

