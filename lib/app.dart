import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'app_providers.dart';
import 'app_bloc_providers.dart';
import 'bloc/call_log/call_log_bloc.dart';
import 'data/auth_state_notifier.dart';
import 'data/datasources/auth_datasource.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'router.dart';
import 'router/app_routes.dart';
import 'theme.dart';
import 'widgets/call_lifecycle_observer.dart';

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
        AuthRepositoryImpl(authDataSource: AuthDataSourceImpl());
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
          providers: buildBlocProviders(),
          child: BlocListener<CallLogBloc, CallLogState>(
            listener: (context, state) {
              if (state is CallLogNavigationPending) {
                _router.pushNamed(AppRoutes.callLog, extra: state.lead);
                context.read<CallLogBloc>().add(const ResetCallLog());
              }
            },
            child: MaterialApp.router(
              title: 'CRM Agent App',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              routerConfig: _router,
              builder: (context, child) => CallLifecycleObserver(child: child ?? const SizedBox.shrink()),
            ),
          ),
        ),
      ),
    );
  }
}
