import 'package:flutter/material.dart';
import '../../../widgets/custom_card.dart';
import '../../../theme.dart';

/// Renders the Log Out card and version numbering footer.
class LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  /// Creates a [LogoutButton].
  const LogoutButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          onTap: onTap,
          padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.logout_rounded, color: AppColors.primaryColor, size: 20),
              const SizedBox(width: 8),
              Text(
                'Log Out',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        AppSpacing.gapLg,
        Text(
          'CRM Agent · v1.0.0',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.textMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
