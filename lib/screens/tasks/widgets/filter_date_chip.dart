import 'package:flutter/material.dart';
import '../../../bloc/tasks/tasks_filter_criteria.dart';
import '../../../theme.dart';

class FilterDateChip extends StatelessWidget {
  final DateRangeType range;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterDateChip({
    super.key,
    required this.range,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.warningText : AppColors.slate300;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.warningTextBackground : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color, width: isSelected ? 1.5 : 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (range == DateRangeType.custom) ...[
              Icon(
                Icons.calendar_today_outlined,
                size: 14,
                color: isSelected ? AppColors.warningText : AppColors.textMuted,
              ),
              SizedBox(width: AppSpacing.xs2),
            ],
            Text(
              range.label,
              style: TextStyle(
                color: isSelected ? AppColors.warningText : AppColors.textMuted,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
