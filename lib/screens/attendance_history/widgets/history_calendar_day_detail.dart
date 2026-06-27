import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_log_model.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'history_calendar_off_day_detail.dart';
import 'history_calendar_working_day_detail.dart';
import 'history_status_badge.dart';

/// Card widget rendering selected calendar day header and detailed contents.
class HistoryCalendarDayDetail extends StatelessWidget {
  /// Selected day log details.
  final AttendanceHistoryLogModel log;

  /// Creates a [HistoryCalendarDayDetail].
  const HistoryCalendarDayDetail({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    final isOff =
        log.status == 'On Leave' ||
        log.status == 'Week Off' ||
        log.status == 'Holiday';
    return CustomCard(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.md,
      ),
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${log.dayName}, ${log.day} May',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                  fontSize: 12.s
                ),
              ),
              HistoryStatusBadge(status: log.status),
            ],
          ),
          AppSpacing.gapLg,
          isOff
              ? HistoryCalendarOffDayDetail(log: log)
              : HistoryCalendarWorkingDayDetail(log: log),
        ],
      ),
    );
  }
}
