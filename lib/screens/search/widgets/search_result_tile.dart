import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../bloc/search/search_result.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../leads/widgets/lead_card.dart';
import '../../tasks/widgets/task_card.dart';
import 'search_follow_up_tile.dart';
import 'spotlight_card.dart';

/// Renders a single search result item by dispatching on its concrete type.
class SearchResultTile extends StatelessWidget {
  final SearchResult item;
  final Map<String, Task> taskMap;

  const SearchResultTile({super.key, required this.item, required this.taskMap});

  @override
  Widget build(BuildContext context) {
    return switch (item) {
      LeadSearchResult(lead: final l) => Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.xs2),
          child: LeadCard(lead: l),
        ),
      TaskSearchResult(task: final t) =>
        SearchResultTaskTile(task: t, taskMap: taskMap),
      SpotlightSearchResult(spotlight: final s) => Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.xs2),
          child: SpotlightCard(spotlight: s),
        ),
      FollowUpSearchResult(followUp: final f) =>
        SearchFollowUpTile(followUp: f),
      _ => const SizedBox.shrink(),
    };
  }
}

/// Renders a task search result resolved against a pre-computed task map.
class SearchResultTaskTile extends StatelessWidget {
  final Task task;
  final Map<String, Task> taskMap;

  const SearchResultTaskTile({super.key, required this.task, required this.taskMap});

  @override
  Widget build(BuildContext context) {
    final resolved = taskMap[task.id] ?? task;
    return TaskCard(task: resolved);
  }
}
