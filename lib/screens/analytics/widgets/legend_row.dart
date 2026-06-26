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
      padding: EdgeInsets.fromLTRB(
        AppSpacing.xl,AppSpacing.sm,AppSpacing.xl,AppSpacing.sm,
      ),
      child: Row(
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          AppSpacing.gapWSm,
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textDark,
                fontWeight: FontWeight.w500,
                fontSize: 13.5.s,
              ),
            ),
          ),
          Text(
            count.toString(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
              fontSize: 13.s,
            ),
          ),
        ],
      ),
    );
  }
}
