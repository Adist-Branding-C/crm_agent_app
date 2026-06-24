import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// A reusable square icon button.
class CardIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final double size;
  final double iconSize;
  final double borderRadius;

  const CardIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.size = 40,
    this.iconSize = 24,
    this.borderRadius = 8,
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
