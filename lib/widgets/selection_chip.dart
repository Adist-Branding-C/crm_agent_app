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
    final textStyle = TextStyle(
      color: isSelected ? AppColors.primaryColor : AppColors.textMuted,
      fontWeight: FontWeight.w600,
      fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
    );

    return Semantics(
      button: true,
      label: option,
      selected: isSelected,
      child: GestureDetector(
        onTap: () => onSelected(option),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColorLight : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color, width: isSelected ? 1.5 : 1),
          ),
          child: Text(option, style: textStyle),
        ),
      ),
    );
  }
}
