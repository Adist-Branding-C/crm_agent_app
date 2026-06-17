import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/search/search_result.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../leads/widgets/lead_card.dart';
import '../../tasks/widgets/task_card.dart';
import 'search_follow_up_tile.dart';
import 'spotlight_card.dart';

/// Renders a single search result item by dispatching on its concrete type.
class SearchResultTile extends StatelessWidget {
  final SearchResult item;

  const SearchResultTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return switch (item) {
      LeadSearchResult(lead: final l) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: LeadCard(lead: l),
        ),
      TaskSearchResult(task: final t) => SearchResultTaskTile(task: t),
      SpotlightSearchResult(spotlight: final s) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: SpotlightCard(spotlight: s),
        ),
      FollowUpSearchResult(followUp: final f) =>
        SearchFollowUpTile(followUp: f),
      _ => const SizedBox.shrink(),
    };
  }
}

/// Renders a task search result resolved dynamically against the Tasks bloc state.
class SearchResultTaskTile extends StatelessWidget {
  final Task task;

  const SearchResultTaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, tasksState) {
        final resolved = tasksState is TasksLoaded
            ? tasksState.allTasks.firstWhere((item) => item.id == task.id, orElse: () => task)
            : task;
        return TaskCard(task: resolved);
      },
    );
  }
}
