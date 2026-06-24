import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_button.dart';

/// Renders the Cancel and Save Changes buttons at the bottom of the edit form.
class EditEnquiryButtons extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;

  const EditEnquiryButtons({
    super.key,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
                side: const BorderSide(color: AppColors.borderLight),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: onCancel,
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          AppSpacing.gapWLg,
          Expanded(
            child: CustomButton(text: 'Save Changes', onPressed: onSave),
          ),
        ],
      ),
    );
  }
}
