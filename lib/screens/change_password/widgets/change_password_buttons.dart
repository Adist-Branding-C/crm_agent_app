import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_button.dart';

/// Horizontal action buttons (Cancel and Update Password).
class ChangePasswordButtons extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSubmit;
  final bool isValid;
  final bool isLoading;

  const ChangePasswordButtons({
    super.key,
    required this.onCancel,
    required this.onSubmit,
    required this.isValid,
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
            text: 'Update Password',
            isLoading: isLoading,
            onPressed: isValid ? onSubmit : null,
          ),
        ),
      ],
    );
  }
}
