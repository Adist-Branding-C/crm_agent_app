import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../theme/app_colors.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Purpose',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textDark),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
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
                  fontSize: 13,
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
