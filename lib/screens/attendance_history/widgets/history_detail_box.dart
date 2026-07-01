import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';

/// Standalone visual box showing timing metrics for selected day.
class HistoryDetailBox extends StatelessWidget {
  final IconData icon;
  final String val;
  final String label;
  final Color color;

  const HistoryDetailBox({
    super.key,
    required this.icon,
    required this.val,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
        decoration: BoxDecoration(
          color: AppColors.slate50,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 18.s),
            AppSpacing.gapXs,
            Text(
              val,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
