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
          child: SizedBox(
            height: 65.h,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.borderLight),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: isLoading ? null : onCancel,
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.s,
                    ),
              ),
            ),
          ),
        ),
        AppSpacing.gapWLg,
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
