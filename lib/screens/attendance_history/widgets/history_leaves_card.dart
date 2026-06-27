import 'package:crm_agent_app/widgets/custom_button.dart';
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
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.sm,
      ),
      padding: EdgeInsets.all(AppSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.infoBackground,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Icons.calendar_today_rounded,
              color: AppColors.info,
              size: 18.s,
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
                    fontSize: 13.s,
                  ),
                ),
                Text(
                  'Avg check-in ${history.avgCheckInTime} · checkout ${history.avgCheckOutTime}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                    fontSize: 10.s,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.w),
                color: AppColors.primaryColorLight.withAlpha(200),
              ),
              height: 60.h,

              child: Center(
                child: Text(
                  "Apply",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
