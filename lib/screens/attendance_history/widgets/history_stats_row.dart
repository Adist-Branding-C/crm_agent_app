import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_model.dart';
import '../../../theme.dart';
import '../../../utils/responsive_helper.dart';
import 'history_stat_card.dart';

/// Row element showing the monthly count metrics for statuses.
class HistoryStatsRow extends StatelessWidget {
  /// History summary data.
  final AttendanceHistoryModel history;

  /// Creates a [HistoryStatsRow].
  const HistoryStatsRow({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    final items = [
      HistoryStatCard(
        count: '${history.presentDays}',
        label: 'Present',
        color: AppColors.success,
      ),
      HistoryStatCard(
        count: '${history.lateCount}',
        label: 'Late',
        color: AppColors.warning,
      ),
      HistoryStatCard(
        count: '${history.halfDayCount}',
        label: 'Half Day',
        color: AppColors.warningText,
      ),
      HistoryStatCard(
        count: '${history.leaveCount}',
        label: 'Leave',
        color: AppColors.info,
      ),
    ];

    final isMobileSmall = ResponsiveHelper.isMobileSmall(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      child: isMobileSmall
          ? Column(
              children: [
                Row(
                  children: [
                    Expanded(child: items[0]),
                    AppSpacing.gapWSm,
                    Expanded(child: items[1]),
                  ],
                ),
                AppSpacing.gapSm,
                Row(
                  children: [
                    Expanded(child: items[2]),
                    AppSpacing.gapWSm,
                    Expanded(child: items[3]),
                  ],
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: items[0]),
                AppSpacing.gapWSm,
                Expanded(child: items[1]),
                AppSpacing.gapWSm,
                Expanded(child: items[2]),
                AppSpacing.gapWSm,
                Expanded(child: items[3]),
              ],
            ),
    );
  }
}
