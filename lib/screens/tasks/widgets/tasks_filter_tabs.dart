import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../widgets/filter_chip_bar.dart';

/// Renders the horizontal scrollable filter tabs (All, Pending, Overdue, Completed).
class TasksFilterTabs extends StatelessWidget {
  const TasksFilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (state is! TasksLoaded) return const SizedBox.shrink();
        final selected = state.filter;
        return FilterChipBar(
          options: [
            for (final entry in [
              (TasksFilter.all, 'All'),
              (TasksFilter.pending, 'Pending'),
              (TasksFilter.overdue, 'Overdue'),
              (TasksFilter.completed, 'Completed'),
            ])
              FilterChipOption(
                label: entry.$2,
                isSelected: selected == entry.$1,
                onTap: () => context.read<TasksBloc>().add(FilterChanged(entry.$1)),
              ),
          ],
        );
      },
    );
  }
}
