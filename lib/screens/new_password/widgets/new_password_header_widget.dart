import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_context_theme.dart';
import '../../../theme/app_spacing.dart';

/// Header widget displaying icon and guidance text for password setup.
class NewPasswordHeaderWidget extends StatelessWidget {
  const NewPasswordHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpacing.gapMd,
        Container(
          padding: EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.successBackground,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.check_circle_outline_rounded,
            color: context.success,
            size: 32,
          ),
        ),
        AppSpacing.gapMd,
        Text(
          'Set new password',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.textDark,
          ),
        ),
        AppSpacing.gapSm,
        Text(
          'Choose a strong password for your account.',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: context.textMuted),
        ),
      ],
    );
  }
}
