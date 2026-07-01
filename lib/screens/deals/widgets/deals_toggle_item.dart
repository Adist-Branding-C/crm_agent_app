import 'package:flutter/material.dart';
import '../../../../theme.dart';

/// Item representing a single option view (Kanban Pipeline vs List) in the toggle bar.
class DealsToggleItem extends StatelessWidget {
  final int index;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const DealsToggleItem({
    super.key,
    required this.index,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 7.0.h, horizontal: 13.0.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.surfaceWhite : AppColors.transparent,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: isSelected ? AppColors.textDark : AppColors.textMuted,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
            fontSize: 12.s,
          ),
        ),
      ),
    );
  }
}
