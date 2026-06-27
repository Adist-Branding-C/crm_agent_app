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
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.slate400,
            fontSize: 10.s,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '${history.presentDays} of ${history.totalWorkingDays} working days',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontSize: 15.s,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HistoryStatColumn(
              value: history.avgHoursPerDay,
              label: 'Avg / day',
            ),
            AppSpacing.gapWLg,
           Container(width: 1.h,height: 60.h,color: Colors.grey,),
           AppSpacing.gapWLg,
            HistoryStatColumn(
              value: '${history.onTimeRate.toInt()}%',
              label: 'On time',
            ),
            AppSpacing.gapWLg,
            Container(width: 1.h,height: 60.h,color: Colors.grey,),
            AppSpacing.gapWLg,
            HistoryStatColumn(value: history.totalLoggedHours, label: 'Logged'),
          ],
        ),
      ],
    );
  }
}
