import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/selection_group.dart';

class EditEnquiryDetailsFields extends StatelessWidget {
  final String selectedSource,
      selectedPurpose,
      selectedCategory,
      selectedStatus;
  final ValueChanged<String> onSourceChanged,
      onPurposeChanged,
      onCategoryChanged,
      onStatusChanged;
  final TextEditingController followUpController, remarksController;

  const EditEnquiryDetailsFields({
    super.key,
    required this.selectedSource,
    required this.onSourceChanged,
    required this.selectedPurpose,
    required this.onPurposeChanged,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.selectedStatus,
    required this.onStatusChanged,
    required this.followUpController,
    required this.remarksController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.all(AppSpacing.lg),
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectionGroup(
            label: 'Source',
            options: LeadSource.values.map((v) => v.label).toList(),
            selectedOption: selectedSource,
            onSelected: onSourceChanged,
          ),
          AppSpacing.gapXl,
          SelectionGroup(
            label: 'Purpose',
            options: LeadPurpose.values.map((v) => v.label).toList(),
            selectedOption: selectedPurpose,
            onSelected: onPurposeChanged,
          ),
          AppSpacing.gapXl,
          SelectionGroup(
            label: 'Lead Type',
            options: LeadCategory.values.map((v) => v.label).toList(),
            selectedOption: selectedCategory,
            onSelected: onCategoryChanged,
          ),
          AppSpacing.gapXl,
          SelectionGroup(
            label: 'Status',
            options: LeadStatus.values.map((v) => v.label).toList(),
            selectedOption: selectedStatus,
            onSelected: onStatusChanged,
          ),
          AppSpacing.gapXl,
          CustomTextField(
            label: 'Next Follow-up',
            hintText: 'e.g. Today, 4:00 PM',
            controller: followUpController,
          ),
          AppSpacing.gapLg,
          CustomTextField(
            label: 'Remarks',
            hintText: 'Add remarks...',
            controller: remarksController,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
