import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Renders a single row representing a metric name, count, and progress bar.
class MetricProgressRow extends StatelessWidget {
  /// The label or name of the metric.
  final String title;

  /// The string count or numeric representation.
  final String count;

  /// The progress value between 0.0 and 1.0.
  final double progressValue;

  /// The color of the filled progress bar.
  final Color barColor;

  /// Creates a constant [MetricProgressRow].
  const MetricProgressRow({
    super.key,
    required this.title,
    required this.count,
    required this.progressValue,
    required this.barColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.textDark,
                  ),
            ),
            Text(
              count,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.textMuted,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        AppSpacing.gapXl,
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progressValue,
            backgroundColor: AppColors.slate100,
            valueColor: AlwaysStoppedAnimation<Color>(barColor),
            minHeight: 6.w,
          ),
        ),
      ],
    );
  }
}
