import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_model.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';

/// Row element showing the monthly count metrics for statuses.
class HistoryStatsRow extends StatelessWidget {
  /// History summary data.
  final AttendanceHistoryModel history;

  /// Creates a [HistoryStatsRow].
  const HistoryStatsRow({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: _buildItem('${history.presentDays}', 'Present', AppColors.success),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildItem('${history.lateCount}', 'Late', AppColors.warning),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildItem('${history.halfDayCount}', 'Half Day', AppColors.warningText),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildItem('${history.leaveCount}', 'Leave', AppColors.info),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String count, String label, Color color) {
    return CustomCard(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            count,
            style: TextStyle(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
