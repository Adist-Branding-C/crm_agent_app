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
              style: const TextStyle(
                color: AppColors.textDark,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: AppColors.textMuted,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progressValue,
            backgroundColor: const Color(0xFFF1F5F9),
            valueColor: AlwaysStoppedAnimation<Color>(barColor),
            minHeight: 5,
          ),
        ),
      ],
    );
  }
}
