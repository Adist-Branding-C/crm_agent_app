import 'package:flutter/material.dart';
import '../../../bloc/deals/deals_models.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';
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
      padding: EdgeInsets.only(right: AppSpacing.sm),
      child: ChoiceChip(
        label: Container(
          
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.circle, color: color, size: 7.s),
              SizedBox(width: AppSpacing.xs2),
              Text(stage.label, style: TextStyle(fontSize: 10.s)),
            ],
          ),
        ),
        selected: isSelected,
        onSelected: (_) => onTap(),
        backgroundColor: Colors.white,
        selectedColor: color.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
          side: BorderSide(
            color: isSelected ? color : AppColors.borderLight,
            width: isSelected ? 1.5.w : 1.w,
          ),
        ),
        showCheckmark: false,
        labelStyle: TextStyle(
          color: isSelected ? color : AppColors.slate600,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 12.s,
        ),
      ),
    );
  }
}
