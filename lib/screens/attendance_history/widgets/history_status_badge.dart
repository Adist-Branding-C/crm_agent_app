import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';
import 'attendance_status_theme.dart';

/// Renders a color-coded chip representing the attendance status.
class HistoryStatusBadge extends StatelessWidget {
  /// Attendance status text (e.g. Present, Late, On Leave).
  final String status;

  /// Creates a constant [HistoryStatusBadge].
  const HistoryStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final statusTheme = AttendanceStatusTheme.resolve(status);
    final bg = statusTheme.bg;
    final fg = statusTheme.fg;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.ten,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: fg,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
