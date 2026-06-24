import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Renders stats cards in a 2x2 grid for mobile layouts.
class VerticalStatsGrid extends StatelessWidget {
  /// The list of cards to render.
  final List<Widget> cards;

  /// Creates a constant [VerticalStatsGrid].
  const VerticalStatsGrid({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: cards[0]),
            AppSpacing.gapWLg,
            Expanded(child: cards[1]),
          ],
        ),
        AppSpacing.gapLg,
        Row(
          children: [
            Expanded(child: cards[2]),
            AppSpacing.gapWLg,
            Expanded(child: cards[3]),
          ],
        ),
      ],
    );
  }
}
