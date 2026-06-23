import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_log_model.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';
import 'attendance_status_theme.dart';

/// Middle element block rendering status badges and location info for log lists.
class HistoryLogItemDetails extends StatelessWidget {
  /// Daily log model.
  final AttendanceHistoryLogModel log;

  /// Creates a [HistoryLogItemDetails].
  const HistoryLogItemDetails({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildBadge(context, log.status),
            if (log.isActive) ...[
              const SizedBox(width: 4),
              _buildBadge(context, 'ACTIVE', isDot: true),
            ],
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(Icons.location_on_outlined, color: AppColors.textMuted, size: 12),
            const SizedBox(width: 4),
            Text(log.location ?? '—', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.textMuted)),
          ],
        ),
        if (log.note != null || log.approvedBy != null) ...[
          const SizedBox(height: 8),
          _buildNoteBlock(context),
        ],
      ],
    );
  }

  Widget _buildBadge(BuildContext context, String text, {bool isDot = false}) {
    final statusTheme = AttendanceStatusTheme.resolve(text);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: statusTheme.bg, borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isDot) ...[
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle),
            ),
            const SizedBox(width: 4),
          ],
          Text(text, style: TextStyle(color: statusTheme.fg, fontSize: context.scaleFont(9), fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildNoteBlock(BuildContext context) {
    final isApproved = log.approvedBy != null;
    final text = log.approvedBy ?? log.note!;
    final icon = isApproved ? Icons.check_circle_outline : Icons.error_outline_rounded;
    final color = isApproved ? AppColors.success : AppColors.warningText;

    return Row(
      children: [
        Icon(icon, color: color, size: 12),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: color, fontSize: context.scaleFont(10), fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
