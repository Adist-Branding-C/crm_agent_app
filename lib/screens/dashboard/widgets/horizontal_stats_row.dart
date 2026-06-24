import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Renders stats cards in a single horizontal row for tablet layouts.
class HorizontalStatsRow extends StatelessWidget {
  /// The list of cards to render.
  final List<Widget> cards;

  /// Creates a constant [HorizontalStatsRow].
  const HorizontalStatsRow({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: cards
          .map(
            (c) => Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: AppSpacing.lg),
                child: c,
              ),
            ),
          )
          .toList(),
    );
  }
}
