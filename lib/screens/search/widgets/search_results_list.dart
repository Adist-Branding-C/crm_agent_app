import 'package:flutter/material.dart';
import '../../../bloc/search/search_bloc.dart';
import '../../../theme.dart';

/// Renders the list of search results categorized by Leads, Tasks, and Spotlights.
class SearchResultsList extends StatelessWidget {
  /// The current loaded search state.
  final SearchLoaded state;

  /// Creates a constant [SearchResultsList].
  const SearchResultsList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final grouped = state.groupedResults;
    if (grouped.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off_rounded, size: 48, color: AppColors.textMuted),
            SizedBox(height: 12),
            Text(
              'No results found',
              style: TextStyle(color: AppColors.textMuted, fontSize: 14),
            ),
          ],
        ),
      );
    }

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

      widgets.addAll(items.map((item) => item.buildTile(context)));
    }

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 24),
      children: widgets,
    );
  }
}
