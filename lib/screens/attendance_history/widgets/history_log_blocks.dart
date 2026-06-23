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
      width: 48,
      height: 48,
      decoration: BoxDecoration(color: statusTheme.bg, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${log.day}',
            style: TextStyle(color: statusTheme.fg, fontSize: context.scaleFont(16), fontWeight: FontWeight.bold),
          ),
          Text(
            log.dayName,
            style: TextStyle(color: statusTheme.fg, fontSize: context.scaleFont(9), fontWeight: FontWeight.bold),
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
    final durationStr = log.hours ?? (log.status == 'On Leave' ? 'Casual leave' : '');
    final isOngoing = log.hours == 'Ongoing';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          timeStr,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
        ),
        if (durationStr.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            durationStr,
            style: TextStyle(
              fontSize: context.scaleFont(10),
              color: isOngoing ? AppColors.success : AppColors.textMuted,
              fontWeight: isOngoing ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ],
    );
  }
}
