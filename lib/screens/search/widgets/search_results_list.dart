import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/search/search_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../theme.dart';
import 'no_results_view.dart';
import 'search_result_tile.dart';

/// Renders the list of search results categorized by Leads, Tasks, and Spotlights.
class SearchResultsList extends StatelessWidget {
  final SearchLoaded state;

  const SearchResultsList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final taskMap = context.select<TasksBloc, Map<String, Task>>(
      (b) => b.state is TasksLoaded
          ? {for (final t in (b.state as TasksLoaded).allTasks) t.id: t}
          : const {},
    );
    final grouped = state.groupedResults;
    if (grouped.isEmpty) return const NoResultsView();

    final categoriesOrder = ['Leads', 'Tasks', 'Spotlights', 'Follow-ups'];
    final widgets = <Widget>[];
    final totalCount = state.results.length;

    widgets.add(Padding(
      padding: EdgeInsets.only(left: AppSpacing.xxl, top: AppSpacing.md, bottom: AppSpacing.sm),
      child: Text('$totalCount result${totalCount == 1 ? "" : "s"}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted)),
    ));

    for (final category in categoriesOrder) {
      final items = grouped[category];
      if (items == null || items.isEmpty) continue;

      widgets.add(Padding(
        padding: EdgeInsets.only(left: AppSpacing.xxl, top: AppSpacing.lg, bottom: AppSpacing.sm),
        child: Text(category.toUpperCase(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textMuted,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8)),
      ));

      widgets.addAll(items.map((item) => SearchResultTile(item: item, taskMap: taskMap)));
    }

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: AppSpacing.xxl),
      children: widgets,
    );
  }
}
