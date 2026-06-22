import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_model.dart';
import '../../../theme.dart';
import 'history_stat_column.dart';

class HistoryStatsText extends StatelessWidget {
  final AttendanceHistoryModel history;

  const HistoryStatsText({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
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
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HistoryStatColumn(value: history.avgHoursPerDay, label: 'Avg / day'),
            HistoryStatColumn(value: '${history.onTimeRate.toInt()}%', label: 'On time'),
            HistoryStatColumn(value: history.totalLoggedHours, label: 'Logged'),
          ],
        ),
      ],
    );
  }
}
