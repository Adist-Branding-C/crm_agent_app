import 'package:flutter/material.dart';
import '../../../theme.dart';

class LegendRow extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const LegendRow({
    super.key,
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          AppSpacing.gapWSm,
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            count.toString(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
