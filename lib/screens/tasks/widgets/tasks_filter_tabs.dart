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
      buildWhen: (prev, curr) {
        if (prev is TasksLoaded && curr is TasksLoaded) {
          return prev.filter != curr.filter;
        }
        return prev.runtimeType != curr.runtimeType;
      },
      builder: (context, state) {
        if (state is! TasksLoaded) return const SizedBox.shrink();
        final selected = state.filter;
        return FilterChipBar(
          options: [
            for (final filter in TasksFilter.values)
              FilterChipOption(
                label: filter.label,
                isSelected: selected == filter,
                onTap: () =>
                    context.read<TasksBloc>().add(FilterChanged(filter)),
              ),
          ],
        );
      },
    );
  }
}
