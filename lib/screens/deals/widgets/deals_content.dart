import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import 'deals_header.dart';
import 'deals_stats.dart';
import 'deals_toggle.dart';
import 'deals_pipeline_view.dart';
import 'deals_list_view.dart';

/// Renders the loaded content of the Deals screen.
class DealsLoadedContent extends StatelessWidget {
  /// The list of deals.
  final List<Deal> deals;

  /// The index of the selected view (0 for Pipeline, 1 for List).
  final int viewIndex;

  /// Callback when the view mode changes.
  final ValueChanged<int> onToggle;

  /// Creates a constant [DealsLoadedContent].
  const DealsLoadedContent({
    super.key,
    required this.deals,
    required this.viewIndex,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DealsHeader(),
        const DealsStats(),
        DealsToggle(
          selectedIndex: viewIndex,
          onChanged: onToggle,
        ),
        const SizedBox(height: 8),
        Expanded(
          child: viewIndex == 0
              ? DealsPipelineView(deals: deals)
              : DealsListView(deals: deals),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
