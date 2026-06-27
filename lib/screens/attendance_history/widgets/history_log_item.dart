import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_log_model.dart';
import '../../../theme.dart';
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
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.xs2,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.r)),
      shadowColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HistoryLogDateBlock(log: log),
            AppSpacing.gapWMd,
            Expanded(child: HistoryLogItemDetails(log: log)),
            AppSpacing.gapWMd,
            HistoryLogTimeBlock(log: log),
          ],
        ),
      ),
    );
  }
}
