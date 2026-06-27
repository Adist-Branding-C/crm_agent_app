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
        padding:  EdgeInsets.symmetric(vertical: 7.0.h, horizontal: 13.0.w),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(9.w),
          
        ),
        alignment: Alignment.center,
        child: Text(
          value,
          style: TextStyle(
            color: isSelected ? AppColors.textDark : AppColors.textMuted,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 13.s,
          ),
        ),
      ),
    );
  }
}
