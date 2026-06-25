import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_log_model.dart';
import '../../../theme.dart';
import 'status_badge.dart';
import 'note_block.dart';

/// Middle element block rendering status badges and location info for log lists.
class HistoryLogItemDetails extends StatelessWidget {
  final AttendanceHistoryLogModel log;

  const HistoryLogItemDetails({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            StatusBadge(text: log.status),
            if (log.isActive) ...[
              AppSpacing.gapWXs,
              StatusBadge(text: 'ACTIVE', showDot: true),
            ],
          ],
        ),
        SizedBox(height: AppSpacing.xs2),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: AppColors.textMuted,
              size: 12,
            ),
            AppSpacing.gapWXs,
            Text(
              log.location ?? '—',
              style: TextStyle(color: AppColors.textMuted, fontSize: 12),
            ),
          ],
        ),
        if (log.note != null || log.approvedBy != null) ...[
          AppSpacing.gapSm,
          NoteBlock(approvedBy: log.approvedBy, note: log.note),
        ],
      ],
    );
  }
}
