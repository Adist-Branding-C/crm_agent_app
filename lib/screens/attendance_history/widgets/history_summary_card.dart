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
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              HistoryProgressCircle(attendanceRate: history.attendanceRate),
              const SizedBox(width: 16),
              Expanded(child: HistoryStatsText(history: history)),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: AppColors.slate600, height: 1),
          const SizedBox(height: 12),
          HistorySummaryCheckoutRow(
            checkedInSince: history.checkedInSince,
            checkInLocation: history.checkInLocation,
          ),
        ],
      ),
    );
  }
}
