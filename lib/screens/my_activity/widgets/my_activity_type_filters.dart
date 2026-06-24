import 'package:flutter/material.dart';
import '../../../data/models/my_activity/my_activity_enums.dart';
import '../../../theme.dart';

/// Entity-type filter row (All, Lead, Task, Deal, Call).
class MyActivityTypeFilters extends StatelessWidget {
  final ActivityTypeFilter selected;
  final ValueChanged<String> onSelected;

  const MyActivityTypeFilters({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
      child: Row(
        children: ActivityTypeFilter.values
            .map((t) => Padding(
                  padding: EdgeInsets.only(right: AppSpacing.sm),
                  child: _TypeChip(
                    label: t.label,
                    isSelected: t == selected,
                    onTap: () => onSelected(t.label),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class _TypeChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TypeChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.textDark : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.textDark : AppColors.borderLight,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textMuted,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
