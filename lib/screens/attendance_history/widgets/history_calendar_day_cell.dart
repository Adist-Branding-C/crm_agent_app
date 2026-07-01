import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_log_model.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';
import 'attendance_status_theme.dart';

/// Single cell rendering the day number, selection outline, and status dot.
class HistoryCalendarDayCell extends StatelessWidget {
  /// Day value.
  final int day;

  /// Log data of the day.
  final AttendanceHistoryLogModel log;

  /// Flag indicating if the day is currently selected.
  final bool isSelected;

  /// Trigger callback on click.
  final VoidCallback? onTap;

  /// Creates a [HistoryCalendarDayCell].
  const HistoryCalendarDayCell({
    super.key,
    required this.day,
    required this.log,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasLog = log.dayName.isNotEmpty;
    Color bg = Colors.transparent;
    Color fg = AppColors.textDark;
    Color dotColor = Colors.transparent;

    if (hasLog) {
      final theme = AttendanceStatusTheme.resolve(log.status);
      bg = theme.bg;
      fg = theme.fg;
      dotColor = theme.fg;
    } else {
      fg = day > 12
          ? AppColors.textMuted.withValues(alpha: 0.5)
          : AppColors.textDark;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(6.w),
          border: isSelected
              ? Border.all(color: AppColors.primaryColor, width: 1.5.w)
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$day',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: fg,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (dotColor != Colors.transparent)
              Container(
                margin: EdgeInsets.only(top: AppSpacing.xxs),
                width: AppSpacing.xs,
                height: AppSpacing.xs,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
