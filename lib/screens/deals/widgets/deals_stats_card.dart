import 'package:flutter/material.dart';
import '../../../../theme.dart';

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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
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
          const SizedBox(height: 8),
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
