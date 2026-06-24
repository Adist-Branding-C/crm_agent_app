import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_model.dart';
import '../../../theme.dart';
import 'history_log_item.dart';

/// List widget that maps the active logs in the history list to HistoryLogItems.
class HistoryLogView extends StatelessWidget {
  /// History summary data.
  final AttendanceHistoryModel history;

  /// Creates a [HistoryLogView].
  const HistoryLogView({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    final activeLogs = history.logs.where((l) => l.dayName.isNotEmpty).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.md),
          child: Text(
            'Daily log',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: activeLogs.length,
          itemBuilder: (context, index) {
            return HistoryLogItem(log: activeLogs[index]);
          },
        ),
      ],
    );
  }
}
