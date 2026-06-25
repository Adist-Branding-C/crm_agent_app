import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_context_theme.dart';
import '../../../theme/app_spacing.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpacing.gapMd,
        Container(
          padding: EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.primaryColorLight,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.phone_android_rounded,
            color: context.primary,
            size: 32,
          ),
        ),
        AppSpacing.gapMd,
        Text(
          'Enter your phone',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.textDark,
          ),
        ),
        AppSpacing.gapSm,
        Text(
          "We'll send a 6-digit OTP to your registered mobile number.",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: context.textMuted),
        ),
      ],
    );
  }
}
