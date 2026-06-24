import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';

/// Renders a color-coded chip representing the attendance status.
class HistoryStatusBadge extends StatelessWidget {
  /// Attendance status text (e.g. Present, Late, On Leave).
  final String status;

  /// Creates a constant [HistoryStatusBadge].
  const HistoryStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bg = AppColors.successBackground;
    Color fg = AppColors.success;
    if (status == 'Late') {
      bg = AppColors.warningLight;
      fg = AppColors.warningText;
    } else if (status == 'Half Day') {
      bg = AppColors.warningTextBackground;
      fg = AppColors.warningText;
    } else if (status == 'On Leave') {
      bg = AppColors.infoBackground;
      fg = AppColors.info;
    } else if (status == 'Holiday') {
      bg = AppColors.accentBackground;
      fg = AppColors.accent;
    } else if (status == 'Week Off') {
      bg = AppColors.slate100;
      fg = AppColors.slate400;
    }

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
        style: TextStyle(
          color: fg,
          fontSize: context.scaleFont(11),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
