import 'package:flutter/material.dart';
import '../../../../theme.dart';

/// A progress indicator widget showing monthly target metrics.
class TargetProgressIndicator extends StatelessWidget {
  final int achieved;
  final int target;

  const TargetProgressIndicator({
    super.key,
    required this.achieved,
    required this.target,
  });

  String _formatToLakhs(num value) {
    final lakhs = value / 100000;
    if (lakhs == lakhs.toInt()) {
      return '₹${lakhs.toInt()}L';
    }
    return '₹${lakhs.toStringAsFixed(2)}L';
  }

  @override
  Widget build(BuildContext context) {
    final percentage = target > 0 ? (achieved / target * 100).round() : 0;
    final progressValue = target > 0 ? (achieved / target).clamp(0.0, 1.0) : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Achieved ${_formatToLakhs(achieved)} of ${_formatToLakhs(target)}',
              style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
            ),
            Text(
              '$percentage%',
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progressValue,
            backgroundColor: AppColors.slate100,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            minHeight: 6,
          ),
        ),
      ],
    );
  }
}
