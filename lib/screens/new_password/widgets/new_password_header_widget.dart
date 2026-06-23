import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_context_theme.dart';

/// Header widget displaying icon and guidance text for password setup.
class NewPasswordHeaderWidget extends StatelessWidget {
  const NewPasswordHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
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
        const SizedBox(height: 24),
        Text(
          'Set new password',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Choose a strong password for your account.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: context.textMuted),
        ),
      ],
    );
  }
}
