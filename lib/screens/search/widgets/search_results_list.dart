import 'package:flutter/material.dart';
import '../../../bloc/search/search_bloc.dart';
import '../../../bloc/search/search_result.dart';
import '../../../theme.dart';
import '../../follow_ups/widgets/follow_up_item_card.dart';
import '../../leads/widgets/lead_card.dart';
import '../../tasks/widgets/task_card.dart';
import 'no_results_view.dart';
import 'spotlight_card.dart';

/// Renders the list of search results categorized by Leads, Tasks, and Spotlights.
class SearchResultsList extends StatelessWidget {
  /// The current loaded search state.
  final SearchLoaded state;

  /// Creates a constant [SearchResultsList].
  const SearchResultsList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final grouped = state.groupedResults;
    if (grouped.isEmpty) return const NoResultsView();

    final categoriesOrder = ['Leads', 'Tasks', 'Spotlights', 'Follow-ups'];
    final widgets = <Widget>[];
    final totalCount = state.results.length;

    widgets.add(
      Padding(
        padding: const EdgeInsets.only(left: 24, top: 12, bottom: 8),
        child: Text(
          '$totalCount result${totalCount == 1 ? "" : "s"}',
          style: const TextStyle(color: AppColors.textMuted, fontSize: 13),
        ),
      ),
    );

    for (final category in categoriesOrder) {
      final items = grouped[category];
      if (items == null || items.isEmpty) continue;

      widgets.add(
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 16, bottom: 8),
          child: Text(
            category.toUpperCase(),
            style: const TextStyle(
              color: AppColors.textMuted,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 0.8,
            ),
          ),
        ),
      );

      widgets.addAll(items.map((item) => _buildResultTile(context, item)));
    }

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 24),
      children: widgets,
    );
  }

  Widget _buildResultTile(BuildContext context, SearchResult item) {
    return switch (item) {
      LeadSearchResult(lead: final l) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: LeadCard(lead: l),
        ),
      TaskSearchResult(task: final t) => TaskCard(task: t),
      SpotlightSearchResult(spotlight: final s) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: SpotlightCard(spotlight: s),
        ),
      FollowUpSearchResult(followUp: final f) => FollowUpItemCard(
          call: f,
          onTap: () {},
        ),
      _ => const SizedBox.shrink(),
    };
  }
}
