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
      fontSize: 13,
    );

    return GestureDetector(
      onTap: () => onSelected(option),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color, width: isSelected ? 1.5 : 1),
        ),
        child: Text(option, style: textStyle),
      ),
    );
  }
}
