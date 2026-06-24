import 'package:flutter/material.dart';
import '../../../data/repositories/spotlight_repository.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';

/// Styled card for displaying a Spotlight or flagged item.
class SpotlightCard extends StatelessWidget {
  /// The spotlight model details to render.
  final Spotlight spotlight;

  /// Creates a constant [SpotlightCard].
  const SpotlightCard({super.key, required this.spotlight});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.sm),
            decoration: const BoxDecoration(
              color: AppColors.warningTextBackground,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.star_rounded,
              color: AppColors.warning,
              size: 22,
            ),
          ),
          AppSpacing.gapWMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  spotlight.title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                AppSpacing.gapXs,
                Text(
                  spotlight.description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
