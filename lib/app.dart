import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'app_providers.dart';
import 'app_bloc_providers.dart';
import 'data/auth_state_notifier.dart';
import 'data/repositories/session_repository.dart';
import 'router.dart';
import 'theme.dart';
import 'widgets/app_builder.dart';

class MyApp extends StatefulWidget {
  final SessionRepository sessionRepository;
  final bool scaleText;

  const MyApp({
    super.key,
    required this.sessionRepository,
    this.scaleText = true,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;
  final _authStateNotifier = AuthStateNotifier();

  @override
  void initState() {
    super.initState();
    _router = createRouter(widget.sessionRepository, _authStateNotifier);
  }

  @override
  void dispose() {
    _authStateNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: buildRepositoryProviders(
        sessionRepository: widget.sessionRepository,
      ),
      child: ChangeNotifierProvider<AuthStateNotifier>.value(
        value: _authStateNotifier,
        child: MultiBlocProvider(
          providers: buildBlocProviders(),
          child: SfsInitBuilder(
            mobileSize: const Size(360, 690),
            tabletSize: const Size(481, 890),
            desktopSize: const Size(1420, 820),
            respectSystemTextScale: true,
            orientationAware: true,
            builder: (context, child) {
              return MaterialApp.router(
                title: 'CRM Agent App',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: ThemeMode.light,
                routerConfig: _router,
                builder: (context, child) =>
                    AppBuilderWidget(scaleText: widget.scaleText, child: child),
              );
            },
          ),
        ),
      ),
    );
  }
}
