import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/settings_notifier.dart';
import 'app_builder.dart';

/// Wraps children with a custom [MediaQuery] text scaling factor
/// computed dynamically based on the [SettingsNotifier] configuration.
class TextScaleBuilder extends StatelessWidget {
  final Widget? child;
  final bool scaleText;

  const TextScaleBuilder({
    super.key,
    required this.child,
    required this.scaleText,
  });

  double _getSuitableTextScaleFactor(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final settings = Provider.of<SettingsNotifier>(context, listen: false);
    double baseWidth = settings.baseWidth;
    double scaleFactor = width / baseWidth;
    return scaleFactor.clamp(0.2, 1.5);
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(_getSuitableTextScaleFactor(context)),
      ),
      child: SafeArea(
        top: false,
        maintainBottomViewPadding: true,
        child: AppBuilderWidget(
          scaleText: scaleText,
          child: child,
        ),
      ),
    );
  }
}
