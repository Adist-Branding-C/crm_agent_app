import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../theme.dart';
import '../../../widgets/screen_header.dart';
import '../../../widgets/card_icon_button.dart';

/// Renders the composed top header of the Tasks page.
class TasksHeader extends StatelessWidget {
  /// Creates a constant [TasksHeader].
  const TasksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        int pending = 0;
        int overdue = 0;
        if (state is TasksLoaded) {
          pending = state.pendingCount;
          overdue = state.overdueCount;
        }

        return ScreenHeader(
          title: 'Tasks',
          subtitleWidget: Text(
            '$pending pending · $overdue overdue',
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          showBackButton: false,
          actions: CardIconButton(
            icon: Icons.add_rounded,
            iconColor: AppColors.primaryColor,
            backgroundColor: Colors.white,
            size: 38,
            borderRadius: 10,
            iconSize: 20,
            onTap: () {},
          ),
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
        );
      },
    );
  }
}
