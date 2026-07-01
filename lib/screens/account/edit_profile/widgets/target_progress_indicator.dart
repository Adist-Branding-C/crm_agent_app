import 'package:flutter/material.dart';
import '../../../../theme.dart';
import '../../../../utils/currency_formatter.dart';

/// A progress indicator widget showing monthly target metrics.
class TargetProgressIndicator extends StatelessWidget {
  final int achieved;
  final int target;

  const TargetProgressIndicator({
    super.key,
    required this.achieved,
    required this.target,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = target > 0 ? (achieved / target * 100).round() : 0;
    final progressValue = target > 0
        ? (achieved / target).clamp(0.0, 1.0)
        : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Achieved ${achieved.toDouble().toRupeeFormat()} of ${target.toDouble().toRupeeFormat()}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                  ),
            ),
            Text(
              '$percentage%',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        AppSpacing.gapSm,
        ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: LinearProgressIndicator(
            value: progressValue,
            backgroundColor: AppColors.slate100,
            valueColor: const AlwaysStoppedAnimation<Color>(
              AppColors.primaryColor,
            ),
            minHeight: 9.h,
          ),
        ),
      ],
    );
  }
}
