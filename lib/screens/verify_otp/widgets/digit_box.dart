import 'package:flutter/material.dart';
import '../../../theme/app_context_theme.dart';

class DigitBox extends StatelessWidget {
  final String char;
  final bool isFocused;

  const DigitBox({super.key, required this.char, required this.isFocused});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isFocused
              ? context.primary
              : (char.isNotEmpty ? context.primary : context.border),
          width: isFocused ? 2.0 : 1.0,
        ),
      ),
      child: isFocused
          ? Container(width: 2, height: 24, color: context.primary)
          : Text(
              char,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.textDark,
              ),
            ),
    );
  }
}
