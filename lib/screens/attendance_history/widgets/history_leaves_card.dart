import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_model.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';

/// Card widget rendering leave balance details and application trigger.
class HistoryLeavesCard extends StatelessWidget {
  /// History summary data.
  final AttendanceHistoryModel history;

  /// Creates a [HistoryLeavesCard].
  const HistoryLeavesCard({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.sm),
      padding: EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.infoBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.calendar_today_rounded,
              color: AppColors.info,
              size: 20,
            ),
          ),
          AppSpacing.gapWMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${history.casualLeavesLeft} casual leaves left',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Avg check-in ${history.avgCheckInTime} · checkout ${history.avgCheckOutTime}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryColorLight,
              foregroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
            ),
            child: Text(
              'Apply',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
