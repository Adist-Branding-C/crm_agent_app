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
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
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
          const SizedBox(width: 12),
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
                const SizedBox(height: 4),
                Text(
                  spotlight.description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
