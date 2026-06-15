import 'package:flutter/material.dart';
import '../theme.dart';

/// A styled card widget sharing uniform borders, backgrounds, and shadows.
class CustomCard extends StatelessWidget {
  /// The contents inside the card.
  final Widget child;

  /// Inner padding.
  final EdgeInsetsGeometry? padding;

  /// Outer margin.
  final EdgeInsetsGeometry? margin;

  /// Background color (defaults to white).
  final Color? color;

  /// Border radius (defaults to 16).
  final double borderRadius;

  /// Custom list of shadows (defaults to AppTheme.cardShadow).
  final List<BoxShadow>? shadow;

  /// Optional border line.
  final BoxBorder? border;

  /// Action when tapped.
  final VoidCallback? onTap;

  /// Creates a [CustomCard].
  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.borderRadius = 16,
    this.shadow,
    this.border,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: shadow ?? AppTheme.cardShadow,
        border: border,
      ),
      child: child,
    );

    if (onTap != null) {
      return Material(
        type: MaterialType.transparency,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap,
          child: card,
        ),
      );
    }
    return card;
  }
}
