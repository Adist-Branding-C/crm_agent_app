import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_log_model.dart';
import '../../../theme.dart';

/// Inside content showing timing metrics for a selected working day.
class HistoryCalendarWorkingDayDetail extends StatelessWidget {
  /// Selected day log details.
  final AttendanceHistoryLogModel log;

  /// Creates a [HistoryCalendarWorkingDayDetail].
  const HistoryCalendarWorkingDayDetail({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildDetailBox(Icons.login_rounded, log.checkInTime ?? '—', 'Check in', AppColors.success),
            const SizedBox(width: 8),
            _buildDetailBox(Icons.logout_rounded, log.checkOutTime ?? '—', 'Check out', AppColors.errorColor),
            const SizedBox(width: 8),
            _buildDetailBox(Icons.access_time_rounded, log.hours ?? '—', 'Hours', AppColors.info),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.location_on_outlined, color: AppColors.textMuted, size: 14),
            const SizedBox(width: 4),
            Text(log.location ?? '—', style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
            const Spacer(),
            if (log.isGpsVerified) ...[
              const Icon(Icons.verified_user_outlined, color: AppColors.success, size: 14),
              const SizedBox(width: 4),
              const Text('GPS verified', style: TextStyle(color: AppColors.success, fontSize: 12, fontWeight: FontWeight.w500)),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildDetailBox(IconData icon, String val, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(color: AppColors.slate50, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(height: 4),
            Text(val, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.textDark)),
            Text(label, style: const TextStyle(fontSize: 10, color: AppColors.textMuted)),
          ],
        ),
      ),
    );
  }
}
