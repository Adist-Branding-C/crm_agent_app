import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/context_text_extension.dart';

class StatusChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const StatusChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      selectedColor: AppColors.successBackground,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? AppColors.success : AppColors.textMuted,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        fontSize: context.scaleFont(13),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isSelected ? AppColors.success : Colors.grey.shade200,
          width: isSelected ? 1.5 : 1,
        ),
      ),
      showCheckmark: false,
    );
  }
}
