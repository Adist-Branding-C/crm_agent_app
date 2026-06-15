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
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout_rounded, color: AppColors.primaryColor, size: 20),
              SizedBox(width: 8),
              Text(
                'Log Out',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'CRM Agent · v1.0.0',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
