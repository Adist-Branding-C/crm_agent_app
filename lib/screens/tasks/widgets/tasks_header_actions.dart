import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/add_task/add_task_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../data/repositories/tasks_repository.dart';
import '../../../theme.dart';
import '../../../widgets/card_icon_button.dart';
import 'add_task_bottom_sheet.dart';
import 'tasks_filter_bottom_sheet.dart';

part 'tasks_header_actions_handlers.dart';

/// Renders the action buttons (Filter and Add) for the Tasks header.
class TasksHeaderActions extends StatelessWidget {
  /// Creates a constant [TasksHeaderActions].
  const TasksHeaderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        final active = state is TasksLoaded && !state.filterCriteria.isEmpty;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CardIconButton(
              icon: Icons.filter_alt_outlined,
              iconColor: active ? AppColors.primaryColor : AppColors.textDark,
              backgroundColor: Colors.white,
              size: 38,
              borderRadius: 10,
              iconSize: 20,
              onTap: () => _openFilter(context),
            ),
            AppSpacing.gapWSm,
            CardIconButton(
              icon: Icons.add_rounded,
              iconColor: AppColors.primaryColor,
              backgroundColor: Colors.white,
              size: 38,
              borderRadius: 10,
              iconSize: 20,
              onTap: () => _openAddTask(context),
            ),
          ],
        );
      },
    );
  }
}
