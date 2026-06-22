import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_log_model.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'attendance_status_theme.dart';
import 'history_log_item_details.dart';

/// Card list item representing a single daily log record in the list view.
class HistoryLogItem extends StatelessWidget {
  /// Daily log model.
  final AttendanceHistoryLogModel log;

  /// Creates a [HistoryLogItem].
  const HistoryLogItem({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateBlock(),
          const SizedBox(width: 12),
          Expanded(child: HistoryLogItemDetails(log: log)),
          const SizedBox(width: 12),
          _buildTimeBlock(),
        ],
      ),
    );
  }

  Widget _buildDateBlock() {
    final statusTheme = AttendanceStatusTheme.resolve(log.status);
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(color: statusTheme.bg, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${log.day}', style: TextStyle(color: statusTheme.fg, fontSize: 16, fontWeight: FontWeight.bold)),
          Text(log.dayName, style: TextStyle(color: statusTheme.fg, fontSize: 9, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTimeBlock() {
    final timeStr = log.checkInTime != null
        ? '${log.checkInTime} – ${log.checkOutTime ?? "now"}'
        : '—';
    final durationStr = log.hours ?? (log.status == 'On Leave' ? 'Casual leave' : '');
    final isOngoing = log.hours == 'Ongoing';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(timeStr, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.textDark)),
        if (durationStr.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            durationStr,
            style: TextStyle(
              fontSize: 10,
              color: isOngoing ? AppColors.success : AppColors.textMuted,
              fontWeight: isOngoing ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ],
    );
  }
}
