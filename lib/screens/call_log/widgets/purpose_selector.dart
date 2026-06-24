import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/context_text_extension.dart';

class PurposeSelector extends StatelessWidget {
  final LeadPurpose selectedPurpose;
  final ValueChanged<LeadPurpose> onPurposeChanged;

  const PurposeSelector({
    super.key,
    required this.selectedPurpose,
    required this.onPurposeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Purpose',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppColors.textDark),
          ),
          AppSpacing.gapSm,
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: LeadPurpose.values.map((p) {
              final isSel = p == selectedPurpose;
              return ChoiceChip(
                label: Text(p.label),
                selected: isSel,
                onSelected: (_) => onPurposeChanged(p),
                selectedColor: AppColors.primaryColorLight,
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: isSel ? AppColors.primaryColor : AppColors.textMuted,
                  fontWeight: isSel ? FontWeight.w600 : FontWeight.normal,
                  fontSize: context.scaleFont(13),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: isSel ? AppColors.primaryColor : Colors.grey.shade200,
                    width: isSel ? 1.5 : 1,
                  ),
                ),
                showCheckmark: false,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
