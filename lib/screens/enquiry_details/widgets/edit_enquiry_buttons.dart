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
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: const BorderSide(color: AppColors.borderLight),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
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
          const SizedBox(width: 16),
          Expanded(
            child: CustomButton(
              text: 'Save Changes',
              onPressed: onSave,
            ),
          ),
        ],
      ),
    );
  }
}
