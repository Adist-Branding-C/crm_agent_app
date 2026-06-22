import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_log_model.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'history_calendar_off_day_detail.dart';
import 'history_calendar_working_day_detail.dart';

/// Card widget rendering selected calendar day header and detailed contents.
class HistoryCalendarDayDetail extends StatelessWidget {
  /// Selected day log details.
  final AttendanceHistoryLogModel log;

  /// Creates a [HistoryCalendarDayDetail].
  const HistoryCalendarDayDetail({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    final isOff = log.status == 'On Leave' || log.status == 'Week Off' || log.status == 'Holiday';
    return CustomCard(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${log.dayName}, ${log.day} May',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textDark),
              ),
              _buildStatusBadge(),
            ],
          ),
          const SizedBox(height: 16),
          isOff
              ? HistoryCalendarOffDayDetail(log: log)
              : HistoryCalendarWorkingDayDetail(log: log),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color bg = AppColors.successBackground;
    Color fg = AppColors.success;
    if (log.status == 'Late') { bg = AppColors.warningLight; fg = AppColors.warningText; }
    else if (log.status == 'Half Day') { bg = AppColors.warningTextBackground; fg = AppColors.warningText; }
    else if (log.status == 'On Leave') { bg = AppColors.infoBackground; fg = AppColors.info; }
    else if (log.status == 'Holiday') { bg = AppColors.accentBackground; fg = AppColors.accent; }
    else if (log.status == 'Week Off') { bg = AppColors.slate100; fg = AppColors.slate400; }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
      child: Text(log.status, style: TextStyle(color: fg, fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }
}
