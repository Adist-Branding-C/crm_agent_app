import 'package:flutter/material.dart';
import '../../../../theme.dart';
import '../../../../widgets/custom_button.dart';

/// Row widgets offering Cancel and Save Changes actions.
class EditProfileActions extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final bool isLoading;

  const EditProfileActions({
    super.key,
    required this.onCancel,
    required this.onSave,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: const BorderSide(color: AppColors.borderLight),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: isLoading ? null : onCancel,
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
          flex: 2,
          child: CustomButton(
            text: 'Save Changes',
            isLoading: isLoading,
            onPressed: onSave,
          ),
        ),
      ],
    );
  }
}
