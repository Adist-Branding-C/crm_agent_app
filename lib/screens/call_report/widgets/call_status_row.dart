import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/colored_dot.dart';
import '../models/call_status_item.dart';

/// A single row showing a colored dot, label, count, and percentage.
class CallStatusRow extends StatelessWidget {
  final CallStatusItem item;

  const CallStatusRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ColoredDot(color: item.color),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              item.label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textDark,
              ),
            ),
          ),
          Text(
            '${item.count}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 36,
            child: Text(
              '${item.percentage}%',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


