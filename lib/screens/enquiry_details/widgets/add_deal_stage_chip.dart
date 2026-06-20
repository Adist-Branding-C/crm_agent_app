import 'package:flutter/material.dart';
import '../../../bloc/deals/deals_models.dart';
import '../../../theme/app_colors.dart';
import '../../deals/widgets/deals_presentation_extensions.dart';

class AddDealStageChip extends StatelessWidget {
  final DealStage stage;
  final bool isSelected;
  final VoidCallback onTap;

  const AddDealStageChip({
    super.key,
    required this.stage,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = stage.color;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
            const SizedBox(width: 6),
            Text(stage.label),
          ],
        ),
        selected: isSelected,
        onSelected: (_) => onTap(),
        backgroundColor: Colors.white,
        selectedColor: color.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: isSelected ? color : AppColors.borderLight, width: isSelected ? 1.5 : 1),
        ),
        showCheckmark: false,
        labelStyle: TextStyle(
          color: isSelected ? color : AppColors.slate600,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 12,
        ),
      ),
    );
  }
}
