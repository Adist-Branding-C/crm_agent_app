import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';

class ToggleItem extends StatelessWidget {
  final String value;
  final String selected;
  final ValueChanged<String> onChanged;

  const ToggleItem({
    super.key,
    required this.value,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selected == value;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? Border.all(color: AppColors.warningDark, width: 1.5)
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          value,
          style: TextStyle(
            color: isSelected ? AppColors.textDark : AppColors.textMuted,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: context.scaleFont(13),
          ),
        ),
      ),
    );
  }
}