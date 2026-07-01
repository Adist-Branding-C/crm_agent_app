import 'package:flutter/material.dart';
import '../theme.dart';

class SelectionChip extends StatelessWidget {
  final String option;
  final String selectedOption;
  final ValueChanged<String> onSelected;

  const SelectionChip({
    super.key,
    required this.option,
    required this.selectedOption,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = option == selectedOption;
    final color = isSelected ? AppColors.primaryColor : AppColors.borderLight;
    final textStyle = Theme.of(context).textTheme.labelMedium?.copyWith(
          color: isSelected ? AppColors.primaryColor : AppColors.textMuted,
        );

    return Semantics(
      button: true,
      label: option,
      selected: isSelected,
      child: GestureDetector(
        onTap: () => onSelected(option),
        child: Container(
          padding:  EdgeInsets.symmetric(
            horizontal: 13.0.w,
            vertical: 7.0.h,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColorLight : Colors.white,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: color, width: isSelected ? 1.5.w : 1.w),
          ),
          child: Text(option, style: textStyle),
        ),
      ),
    );
  }
}
