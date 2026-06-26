import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';

/// A styled card widget sharing uniform borders and backgrounds.
class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? borderRadius;
  final BoxBorder? border;
  final VoidCallback? onTap;

   const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.borderRadius ,
    this.border,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? 8.r; // Default border radius if not provided
    final card = Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        border: border,
      ),
      child: child,
    );

    if (onTap != null) {
      return Semantics(
        button: true,
        child: Material(
          type: MaterialType.transparency,
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
          child: InkWell(
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
            onTap: onTap,
            child: card,
          ),
        ),
      );
    }
    return card;
  }
}
