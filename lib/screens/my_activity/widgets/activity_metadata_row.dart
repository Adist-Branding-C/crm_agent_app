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
        const SizedBox(width: 4),
        Text(
          assignee,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        const Text('·',
            style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
        const SizedBox(width: 8),
        const Icon(Icons.access_time_rounded,
            size: 14, color: AppColors.textMuted),
        const SizedBox(width: 4),
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
