import 'package:flutter/material.dart';
import '../theme.dart';
import 'call_lifecycle_observer.dart';
import 'call_log_navigation_handler.dart';

class AppBuilderWidget extends StatelessWidget {
  final Widget? child;
  final bool scaleText;

  const AppBuilderWidget({
    super.key,
    required this.child,
    required this.scaleText,
  });

  @override
  Widget build(BuildContext context) {
    final inner = CallLogNavigationHandler(
      child: CallLifecycleObserver(
        child: child ?? const SizedBox.shrink(),
      ),
    );
    if (scaleText) {
      return Theme(
        data: AppTheme.scaledLightTheme(context),
        child: inner,
      );
    }
    return inner;
  }
}
