import 'package:flutter/material.dart';
import '../theme.dart';
import 'custom_button_helpers.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final ButtonStyle? buttonStyle;
  final IconData? icon;
  final String? semanticsLabel;
  final List<BoxShadow>? shadow;

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
          style: (buttonStyle ?? Theme.of(context).elevatedButtonTheme.style)?.copyWith(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) return AppColors.slate300;
              return null;
            }),
          ),
          onPressed: active ? onPressed : null,
          child: isLoading ? const ButtonLoading() : ButtonLabel(text: text, icon: icon),
        ),
      ),
    );
  }
}
