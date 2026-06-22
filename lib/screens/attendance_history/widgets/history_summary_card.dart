import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_model.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'history_summary_checkout_row.dart';

/// Card widget rendering the visual overview metrics for the active month.
class HistorySummaryCard extends StatelessWidget {
  /// History summary data.
  final AttendanceHistoryModel history;

  /// Creates a [HistorySummaryCard].
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
              _buildProgressCircle(),
              const SizedBox(width: 16),
              Expanded(child: _buildStatsText(context)),
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

  Widget _buildProgressCircle() {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: history.attendanceRate / 100,
            strokeWidth: 6,
            color: AppColors.success,
            backgroundColor: AppColors.slate600,
          ),
          Text(
            '${history.attendanceRate.toInt()}%',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Attendance this month',
          style: TextStyle(color: AppColors.slate400, fontSize: 12),
        ),
        Text(
          '${history.presentDays} of ${history.totalWorkingDays} working days',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildStatCol(history.avgHoursPerDay, 'Avg / day'),
            _buildStatCol('${history.onTimeRate.toInt()}%', 'On time'),
            _buildStatCol(history.totalLoggedHours, 'Logged'),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCol(String val, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          val,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        Text(label, style: const TextStyle(color: AppColors.slate400, fontSize: 11)),
      ],
    );
  }
}
