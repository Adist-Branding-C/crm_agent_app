import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_log_model.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';
import 'attendance_status_theme.dart';

class HistoryLogDateBlock extends StatelessWidget {
  final AttendanceHistoryLogModel log;

  const HistoryLogDateBlock({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    final statusTheme = AttendanceStatusTheme.resolve(log.status);
    return Container(
      width: 48.w,
      height: 48.w,
      decoration: BoxDecoration(
        color: statusTheme.bg,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${log.day}',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: statusTheme.fg,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            log.dayName,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: statusTheme.fg,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryLogTimeBlock extends StatelessWidget {
  final AttendanceHistoryLogModel log;

  const HistoryLogTimeBlock({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    final timeStr = log.checkInTime != null
        ? '${log.checkInTime} – ${log.checkOutTime ?? "now"}'
        : '—';
    final durationStr =
        log.hours ?? (log.status == 'On Leave' ? 'Casual leave' : '');
    final isOngoing = log.hours == 'Ongoing';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          timeStr,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        if (durationStr.isNotEmpty) ...[
          AppSpacing.gapXs,
          Text(
            durationStr,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: isOngoing ? AppColors.success : AppColors.textMuted,
              fontWeight: isOngoing ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ],
    );
  }
}
