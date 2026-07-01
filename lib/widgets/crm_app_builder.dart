import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../data/settings_notifier.dart';
import '../theme.dart';
import 'text_scale_builder.dart';

/// Wraps initialization of sizing builder, text scale, and MaterialApp router.
class CRMAppBuilder extends StatelessWidget {
  /// The router config to navigate pages.
  final GoRouter router;

  /// Whether to scale text globally.
  final bool scaleText;

  /// Creates a constant [CRMAppBuilder].
  const CRMAppBuilder({
    super.key,
    required this.router,
    required this.scaleText,
  });

  @override
  Widget build(BuildContext context) {
    return SfsInitBuilder(
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
          routerConfig: router,
          builder: (context, child) => TextScaleBuilder(
            scaleText: scaleText,
            child: child,
          ),
        );
      },
    );
  }
}
