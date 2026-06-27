import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/add_task/add_task_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../theme.dart';
import '../../../widgets/card_icon_button.dart';
import 'add_task_bottom_sheet.dart';
import 'tasks_filter_bottom_sheet.dart';

/// Renders the action buttons (Filter and Add) for the Tasks header.
class TasksHeaderActions extends StatelessWidget {
  /// Creates a constant [TasksHeaderActions].
  const TasksHeaderActions({super.key});

  Future<void> _openFilter(BuildContext context) async {
    final bloc = context.read<TasksBloc>();
    final state = bloc.state;
    if (state is! TasksLoaded) return;

    final res = await showModalBottomSheet<TaskFilterCriteria>(
      context: context, isScrollControlled: true, backgroundColor: Colors.transparent,
      builder: (_) => TasksFilterBottomSheet(initialCriteria: state.filterCriteria),
    );
    if (res != null) bloc.add(ApplyFilterCriteria(res));
  }

  Future<void> openAddTask(BuildContext context) async {
    final bloc = context.read<TasksBloc>();
    final isAdded = await showModalBottomSheet<bool>(
      context: context, isScrollControlled: true, backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider(
        create: (context) => AddTaskBloc(tasksRepository: context.read()),
        child: const AddTaskBottomSheet(),
      ),
    );
    if (isAdded == true) bloc.add(const LoadTasks());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocSelector<TasksBloc, TasksState, bool>(
          selector: (s) => s is TasksLoaded && !s.filterCriteria.isEmpty,
          builder: (_, active) => CardIconButton(
            icon: Icons.filter_alt_outlined,
            iconColor: active ? AppColors.primaryColor : AppColors.textDark,
            backgroundColor: Colors.white,
            size: 38, borderRadius: 10, iconSize: 20,
            onTap: () => _openFilter(context),
          ),
        ),
        AppSpacing.gapWSm,
        CardIconButton(
          icon: Icons.add_rounded,
          iconColor: AppColors.primaryColor,
          backgroundColor: Colors.white,
          size: 38, borderRadius: 10, iconSize: 20,
          onTap: () => openAddTask(context),
        ),
      ],
    );
  }
}
