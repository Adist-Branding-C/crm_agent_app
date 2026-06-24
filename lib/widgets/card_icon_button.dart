import 'package:flutter/material.dart';
import '../theme.dart';

/// A reusable shadow-styled square icon button.
class CardIconButton extends StatelessWidget {
  /// The icon vector.
  final IconData icon;

  /// Trigger callback.
  final VoidCallback onTap;

  /// Custom icon color (defaults to AppColors.textDark).
  final Color? iconColor;

  /// Background color of the card (defaults to white).
  final Color? backgroundColor;

  /// Width/height diameter (defaults to 40).
  final double size;

  /// Size of the icon (defaults to 24).
  final double iconSize;

  /// Corner border radius (defaults to 12).
  final double borderRadius;

  /// Optional shadow override (defaults to AppTheme.cardShadow).
  final List<BoxShadow>? shadow;

  /// Creates a [CardIconButton].
  const CardIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.size = 40,
    this.iconSize = 24,
    this.borderRadius = 12,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: shadow ?? AppTheme.cardShadow,
          ),
          child: Icon(
            icon,
            color: iconColor ?? AppColors.textDark,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
