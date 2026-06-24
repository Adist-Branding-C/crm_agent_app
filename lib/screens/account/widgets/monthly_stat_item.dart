import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';

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
            fontSize: context.scaleFont(22),
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
        AppSpacing.gapXs,
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.textMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
