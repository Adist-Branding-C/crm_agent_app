import 'package:flutter/material.dart';
import '../theme.dart';

/// A standard loading spinner for buttons.
class ButtonLoading extends StatelessWidget {
  /// Creates a [ButtonLoading] spinner.
  const ButtonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
    );
  }
}

/// A standard label layout (with optional icon) for buttons.
class ButtonLabel extends StatelessWidget {
  /// Text label.
  final String text;

  /// Optional icon.
  final IconData? icon;

  /// Creates a [ButtonLabel].
  const ButtonLabel({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[Icon(icon, size: 18), AppSpacing.gapWSm],
        Text(text),
      ],
    );
  }
}
