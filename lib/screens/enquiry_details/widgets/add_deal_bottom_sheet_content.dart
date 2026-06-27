import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../theme.dart';
import 'add_deal_controller.dart';
import 'add_deal_lead_card.dart';
import 'add_deal_form_fields.dart';
import 'add_deal_stage_selector.dart';
import 'add_deal_date_picker.dart';
import 'add_deal_submit_button.dart';
import 'add_deal_header.dart';

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
        left: 17.0.w,
        right: 17.0.w,
        top: 5.h,
        bottom: 25.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
             const AddDealHeader(),
           
             AppSpacing.gapXxxl,
            
            AddDealLeadCard(lead: lead),
            AppSpacing.gapXxxl,
            AddDealFormFields(
              nameController: controller.nameController,
              amountController: controller.amountController,
            ),
            
            AddDealStageSelector(
              selectedStage: controller.selectedStage,
              onStageSelected: controller.selectStage,
            ),
            AppSpacing.gapXxl,
            AddDealDatePicker(
              selectedDate: controller.expectedClose,
              onDateSelected: controller.selectExpectedClose,
            ),
            AppSpacing.gapXl,
            if (controller.errorMessage != null)
              Padding(
                padding: EdgeInsets.only(bottom: AppSpacing.sm),
                child: Text(
                  controller.errorMessage!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.errorColor),
                  textAlign: TextAlign.center,
                ),
              ),
              AppSpacing.gapXxl,
            AddDealSubmitButton(
              isValid: controller.isValid,
              isLoading: controller.isLoading,
              onPressed: onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
