import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_model.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'history_progress_circle.dart';
import 'history_stats_text.dart';
import 'history_summary_checkout_row.dart';

class HistorySummaryCard extends StatelessWidget {
  final AttendanceHistoryModel history;

  const HistorySummaryCard({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: AppColors.checkedInCardBg,
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.sm),
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Row(
            children: [
              HistoryProgressCircle(attendanceRate: history.attendanceRate),
              AppSpacing.gapWLg,
              Expanded(child: HistoryStatsText(history: history)),
            ],
          ),
          AppSpacing.gapLg,
          const Divider(color: AppColors.slate600, height: 1),
          AppSpacing.gapMd,
          HistorySummaryCheckoutRow(
            checkedInSince: history.checkedInSince,
            checkInLocation: history.checkInLocation,
          ),
        ],
      ),
    );
  }
}
