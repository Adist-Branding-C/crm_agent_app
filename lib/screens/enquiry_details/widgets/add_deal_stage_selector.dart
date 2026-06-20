import 'package:flutter/material.dart';
import '../../../bloc/deals/deals_models.dart';
import '../../../theme/app_colors.dart';

class AddDealStageSelector extends StatelessWidget {
  final DealStage selectedStage;
  final ValueChanged<DealStage> onStageSelected;

  const AddDealStageSelector({
    super.key,
    required this.selectedStage,
    required this.onStageSelected,
  });

  Color _getStageColor(DealStage stage) {
    switch (stage) {
      case DealStage.newStage: return AppColors.info;
      case DealStage.qualified: return AppColors.accent;
      case DealStage.proposal: return AppColors.warning;
      case DealStage.negotiation: return AppColors.warningText;
      case DealStage.won: return AppColors.success;
    }
  }

  Color _getStageBg(DealStage stage) {
    switch (stage) {
      case DealStage.newStage: return AppColors.infoBackground;
      case DealStage.qualified: return AppColors.accentBackground;
      case DealStage.proposal: return AppColors.warningBackground;
      case DealStage.negotiation: return AppColors.warningTextBackground;
      case DealStage.won: return AppColors.successBackground;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Stage',
          style: TextStyle(
            color: AppColors.slate600,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: DealStage.values.map((stage) {
              final isSelected = selectedStage == stage;
              final color = _getStageColor(stage);
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8, height: 8,
                        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 6),
                      Text(stage.label),
                    ],
                  ),
                  selected: isSelected,
                  onSelected: (_) => onStageSelected(stage),
                  backgroundColor: Colors.white,
                  selectedColor: _getStageBg(stage),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: isSelected ? color : AppColors.borderLight,
                      width: isSelected ? 1.5 : 1,
                    ),
                  ),
                  showCheckmark: false,
                  labelStyle: TextStyle(
                    color: isSelected ? color : AppColors.slate600,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
