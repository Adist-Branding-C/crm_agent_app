import 'package:flutter/material.dart';
import '../../../../theme.dart';
import '../../../../widgets/custom_card.dart';

/// A card displaying a single statistic for the Deals screen.
class DealsStatsCard extends StatelessWidget {
  /// The title of the statistic.
  final String title;

  /// The value of the statistic.
  final String value;

  /// The background color of the card.
  final Color backgroundColor;

  /// Creates a constant [DealsStatsCard].
  const DealsStatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: backgroundColor,
      padding: AppSpacing.cardPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.whiteAlpha60,
              fontWeight: FontWeight.w500,
            ),
          ),
          AppSpacing.gapSm,
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
