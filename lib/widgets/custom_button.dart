import 'package:flutter/material.dart';
import '../theme.dart';

/// A reusable elevated custom action button.
class CustomButton extends StatelessWidget {
  /// The text label of the button.
  final String text;

  /// The action callback, disabled when null.
  final VoidCallback? onPressed;

  /// Displays a loading progress indicator when true.
  final bool isLoading;

  /// Optional icon to render inside the button.
  final IconData? icon;

  /// Semantics label for accessibility.
  final String? semanticsLabel;

  /// Creates a [CustomButton].
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    final active = onPressed != null && !isLoading;
    final shadow = active ? AppTheme.buttonShadow : <BoxShadow>[];

    return Semantics(
      button: true,
      enabled: active,
      label: semanticsLabel ?? text,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: shadow),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: active
                ? AppColors.primaryColor
                : const Color(0xFFCBD5E1),
            foregroundColor: Colors.white,
          ),
          onPressed: active ? onPressed : null,
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(icon, size: 18),
                      const SizedBox(width: 8),
                    ],
                    Text(text),
                  ],
                ),
        ),
      ),
    );
  }
}
