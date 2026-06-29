import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'app_providers.dart';
import 'app_bloc_providers.dart';
import 'data/auth_state_notifier.dart';
import 'data/repositories/session_repository.dart';
import 'data/repositories/settings_repository_impl.dart';
import 'data/settings_notifier.dart';
import 'router.dart';
import 'theme.dart';
import 'widgets/text_scale_builder.dart';

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
  final _settingsNotifier = SettingsNotifier(SettingsRepositoryImpl())..loadSettings();

  @override
  void initState() {
    super.initState();
    _router = createRouter(
      widget.sessionRepository,
      _authStateNotifier,
      _settingsNotifier,
    );
  }

  @override
  void dispose() {
    _authStateNotifier.dispose();
    _settingsNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsNotifier>.value(value: _settingsNotifier),
        ...buildRepositoryProviders(sessionRepository: widget.sessionRepository),
      ],
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
              final settings = context.watch<SettingsNotifier>();
              return MaterialApp.router(
                title: 'CRM Agent App ',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme(fontStyle: settings.fontStyle),
                darkTheme: AppTheme.darkTheme(fontStyle: settings.fontStyle),
                themeMode: ThemeMode.light,
                routerConfig: _router,
                builder: (context, child) => TextScaleBuilder(
                  scaleText: widget.scaleText,
                  child: child,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
