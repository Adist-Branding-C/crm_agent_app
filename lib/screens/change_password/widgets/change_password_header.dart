import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../theme/app_context_theme.dart';
import '../../../widgets/custom_card.dart';

/// Top card display with lock icon and requirements.
class ChangePasswordHeader extends StatelessWidget {
  const ChangePasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.primaryColorLight,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.lock_outline_rounded,
              color: AppColors.primaryColor,
              size: 24.s,
            ),
          ),
          AppSpacing.gapLg,
          Text(
            'Use at least 8 characters with a mix of\nuppercase, lowercase and numbers.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: context.textMuted,
              fontWeight: FontWeight.w500,
              fontSize: 12.s,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
