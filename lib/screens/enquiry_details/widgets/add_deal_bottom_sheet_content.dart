import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../theme/app_colors.dart';
import 'add_deal_controller.dart';
import 'add_deal_lead_card.dart';
import 'add_deal_form_fields.dart';
import 'add_deal_stage_selector.dart';
import 'add_deal_date_picker.dart';
import 'add_deal_submit_button.dart';

class AddDealBottomSheetContent extends StatelessWidget {
  final Lead lead;
  final AddDealController controller;
  final VoidCallback onSubmit;

  const AddDealBottomSheetContent({
    super.key,
    required this.lead,
    required this.controller,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20, right: 20, top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 40, height: 4,
              decoration: const BoxDecoration(
                color: AppColors.slate300,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('New Deal', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.textDark, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          AddDealLeadCard(lead: lead),
          const SizedBox(height: 16),
          AddDealFormFields(nameController: controller.nameController, amountController: controller.amountController),
          const SizedBox(height: 16),
          AddDealStageSelector(selectedStage: controller.selectedStage, onStageSelected: controller.selectStage),
          const SizedBox(height: 16),
          AddDealDatePicker(selectedDate: controller.expectedClose, onDateSelected: controller.selectExpectedClose),
          const SizedBox(height: 20),
          if (controller.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                controller.errorMessage!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.errorColor),
                textAlign: TextAlign.center,
              ),
            ),
          AddDealSubmitButton(
            isValid: controller.isValid,
            isLoading: controller.isLoading,
            onPressed: onSubmit,
          ),
        ],
      ),
    );
  }
}
