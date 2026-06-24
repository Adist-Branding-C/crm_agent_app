import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Metadata row showing assignee name and time.
class ActivityMetadataRow extends StatelessWidget {
  final String assignee;
  final String time;

  const ActivityMetadataRow({
    super.key,
    required this.assignee,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.person_outline_rounded,
            size: 14, color: AppColors.textMuted),
        AppSpacing.gapWXs,
        Text(
          assignee,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppSpacing.gapWSm,
        const Text('·',
            style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
        AppSpacing.gapWSm,
        const Icon(Icons.access_time_rounded,
            size: 14, color: AppColors.textMuted),
        AppSpacing.gapWXs,
        Text(
          time,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
