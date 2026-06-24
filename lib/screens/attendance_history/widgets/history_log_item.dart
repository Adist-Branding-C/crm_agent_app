import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_log_model.dart';
import 'history_log_blocks.dart';
import 'history_log_item_details.dart';

/// Card list item representing a single daily log record in the list view.
class HistoryLogItem extends StatelessWidget {
  /// Daily log model.
  final AttendanceHistoryLogModel log;

  /// Creates a [HistoryLogItem].
  const HistoryLogItem({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HistoryLogDateBlock(log: log),
            const SizedBox(width: 12),
            Expanded(child: HistoryLogItemDetails(log: log)),
            const SizedBox(width: 12),
            HistoryLogTimeBlock(log: log),
          ],
        ),
      ),
    );
  }
}
