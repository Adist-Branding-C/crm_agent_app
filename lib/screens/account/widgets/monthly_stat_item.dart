import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Renders a single monthly statistic item.
class MonthlyStatItem extends StatelessWidget {
  final String value;
  final String label;
  final Color valueColor;

  /// Creates a [MonthlyStatItem].
  const MonthlyStatItem({
    super.key,
    required this.value,
    required this.label,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
