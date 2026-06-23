import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/colored_dot.dart';
import '../models/lead_status_item.dart';

/// A single legend entry: colored dot on top, count bold, label below.
class LeadStatusLegendItem extends StatelessWidget {
  final LeadStatusItem item;

  const LeadStatusLegendItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ColoredDot(color: item.color),
        const SizedBox(height: 4),
        Text(
          '${item.count}',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          item.label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}


