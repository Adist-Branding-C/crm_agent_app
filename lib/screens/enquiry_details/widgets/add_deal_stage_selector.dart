import 'package:flutter/material.dart';
import '../../../bloc/deals/deals_models.dart';
import '../../../theme/app_colors.dart';
import 'add_deal_stage_chip.dart';

class AddDealStageSelector extends StatelessWidget {
  final DealStage selectedStage;
  final ValueChanged<DealStage> onStageSelected;

  const AddDealStageSelector({
    super.key,
    required this.selectedStage,
    required this.onStageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Stage', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.slate600, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: DealStage.values.map((stage) => AddDealStageChip(
              stage: stage,
              isSelected: selectedStage == stage,
              onTap: () => onStageSelected(stage),
            )).toList(),
          ),
        ),
      ],
    );
  }
}
