import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_log_model.dart';
import '../../../theme.dart';

/// Inside content showing context notes for a selected non-working day.
class HistoryCalendarOffDayDetail extends StatelessWidget {
  /// Selected day log details.
  final AttendanceHistoryLogModel log;

  /// Creates a [HistoryCalendarOffDayDetail].
  const HistoryCalendarOffDayDetail({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(log.note ?? 'No activity recorded.', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted)),
        if (log.approvedBy != null) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.check_circle_outline, color: AppColors.success, size: 16),
              const SizedBox(width: 4),
              Text(log.approvedBy!, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.success, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ],
    );
  }
}
