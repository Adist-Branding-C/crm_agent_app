import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'app_providers.dart';
import 'app_bloc_providers.dart';
import 'data/auth_state_notifier.dart';
import 'data/repositories/auth_repository.dart';
import 'router.dart';
import 'theme.dart';
import 'widgets/call_lifecycle_observer.dart';
import 'widgets/call_log_navigation_handler.dart';

class MyApp extends StatefulWidget {
  final AuthRepository authRepository;

  const MyApp({super.key, required this.authRepository});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;
  final _authStateNotifier = AuthStateNotifier();

  @override
  void initState() {
    super.initState();
    _router = createRouter(widget.authRepository, _authStateNotifier);
  }

  @override
  void dispose() {
    _authStateNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: buildRepositoryProviders(authRepository: widget.authRepository),
      child: ChangeNotifierProvider<AuthStateNotifier>.value(
        value: _authStateNotifier,
        child: MultiBlocProvider(
          providers: buildBlocProviders(),
          child: CallLogNavigationHandler(
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
