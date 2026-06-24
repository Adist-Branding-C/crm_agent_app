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
        Text(
          'Attendance this month',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.slate400),
        ),
        Text(
          '${history.presentDays} of ${history.totalWorkingDays} working days',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HistoryStatColumn(
              value: history.avgHoursPerDay,
              label: 'Avg / day',
            ),
            HistoryStatColumn(
              value: '${history.onTimeRate.toInt()}%',
              label: 'On time',
            ),
            HistoryStatColumn(value: history.totalLoggedHours, label: 'Logged'),
          ],
        ),
      ],
    );
  }
}
