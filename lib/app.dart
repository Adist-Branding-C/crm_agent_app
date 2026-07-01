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
import 'widgets/crm_app_builder.dart';

/// The root application widget.
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
          child: CRMAppBuilder(
            router: _router,
            scaleText: widget.scaleText,
          ),
        ),
      ),
    );
  }
}
