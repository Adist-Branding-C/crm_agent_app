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

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.buttonStyle,
    this.icon,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    final active = onPressed != null && !isLoading;

    return Semantics(
      button: true,
      enabled: active,
      label: semanticsLabel ?? text,
      child: SizedBox(
        width: width,
        child: ElevatedButton(
          style: (buttonStyle ?? Theme.of(context).elevatedButtonTheme.style)
              ?.copyWith(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.disabled))
                    return AppColors.slate300;
                  return null;
                }),
              ),
          onPressed: active ? onPressed : null,
          child: isLoading
              ? const ButtonLoading()
              : ButtonLabel(text: text, icon: icon),
        ),
      ),
    );
  }
}
