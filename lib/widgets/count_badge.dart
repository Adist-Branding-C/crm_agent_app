import 'package:flutter/material.dart';
import '../theme.dart';

/// A badge displaying a numeric count indicator, typically used in section headers.
class CountBadge extends StatelessWidget {
  /// The numeric count to display.
  final int count;

  /// Background color of the count badge.
  final Color? bgColor;

  /// Text color of the count badge.
  final Color? textColor;

  /// Whether the badge is the small variant.
  final bool isSmall;

  /// Creates a [CountBadge].
  const CountBadge({
    super.key,
    required this.count,
    this.bgColor,
    this.textColor,
    this.isSmall = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 8.0 : 10.0,
        vertical: isSmall ? 2.0 : 4.0,
      ),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.slate100,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        '$count',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: textColor ?? AppColors.textMuted,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
