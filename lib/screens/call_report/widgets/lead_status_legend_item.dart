import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
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
        _Dot(color: item.color),
        const SizedBox(height: 4),
        Text(
          '${item.count}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          item.label,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;
  const _Dot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
