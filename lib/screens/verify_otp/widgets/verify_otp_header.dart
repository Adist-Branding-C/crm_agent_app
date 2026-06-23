import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_context_theme.dart';

class VerifyOtpHeader extends StatelessWidget {
  final String phone;

  const VerifyOtpHeader({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryColorLight,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.fingerprint_rounded,
            color: context.primary,
            size: 32,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Enter OTP',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'We sent a 6-digit code to\n$phone',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: context.textMuted),
        ),
      ],
    );
  }
}
