import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';

/// Top card display with lock icon and requirements.
class ChangePasswordHeader extends StatelessWidget {
  const ChangePasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryColorLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.lock_outline_rounded,
              color: AppColors.primaryColor,
              size: 24,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Use at least 8 characters with a mix of\nuppercase, lowercase and numbers.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textMuted,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
