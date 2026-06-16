import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// A badge displaying a numeric count indicator, typically used in section headers.
class CountBadge extends StatelessWidget {
  /// The numeric count to display.
  final int count;

  /// Background color of the count badge.
  final Color? bgColor;

  /// Text color of the count badge.
  final Color? textColor;

  /// Creates a [CountBadge].
  const CountBadge({
    super.key,
    required this.count,
    this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.slate100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '$count',
        style: TextStyle(
          color: textColor ?? AppColors.textMuted,
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }
}
