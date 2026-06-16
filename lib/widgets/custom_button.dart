import 'package:flutter/material.dart';
import '../theme.dart';
import 'custom_button_helpers.dart';

/// A reusable elevated custom action button.
class CustomButton extends StatelessWidget {
  /// The text label of the button.
  final String text;

  /// The action callback, disabled when null.
  final VoidCallback? onPressed;

  /// Displays a loading progress indicator when true.
  final bool isLoading;

  /// Optional width to constrain the button size.
  final double? width;

  /// Optional custom style override for the button.
  final ButtonStyle? buttonStyle;

  /// Optional icon to render inside the button.
  final IconData? icon;

  /// Semantics label for accessibility.
  final String? semanticsLabel;

  /// Optional shadow override.
  final List<BoxShadow>? shadow;

  /// Creates a [CustomButton].
  const CustomButton({
    super.key, required this.text, this.onPressed, this.isLoading = false,
    this.width, this.buttonStyle, this.icon, this.semanticsLabel, this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    final active = onPressed != null && !isLoading;
    final resolvedShadow = shadow ?? (active ? AppTheme.buttonShadow : <BoxShadow>[]);

    return Semantics(
      button: true,
      enabled: active,
      label: semanticsLabel ?? text,
      child: Container(
        width: width,
        decoration: BoxDecoration(boxShadow: resolvedShadow),
        child: ElevatedButton(
          style: buttonStyle ?? ElevatedButton.styleFrom(
            backgroundColor: active ? AppColors.primaryColor : AppColors.slate300,
            foregroundColor: Colors.white,
          ),
          onPressed: active ? onPressed : null,
          child: isLoading ? const ButtonLoading() : ButtonLabel(text: text, icon: icon),
        ),
      ),
    );
  }
}
