import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../theme.dart';

/// Renders the horizontal scrollable filter tabs (All, Pending, Overdue, Completed).
class TasksFilterTabs extends StatelessWidget {
  /// Creates a constant [TasksFilterTabs].
  const TasksFilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (state is! TasksLoaded) return const SizedBox.shrink();
        final selected = state.filter;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              _buildTab(context, TasksFilter.all, 'All', selected == TasksFilter.all),
              _buildTab(context, TasksFilter.pending, 'Pending', selected == TasksFilter.pending),
              _buildTab(context, TasksFilter.overdue, 'Overdue', selected == TasksFilter.overdue),
              _buildTab(context, TasksFilter.completed, 'Completed', selected == TasksFilter.completed),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTab(
    BuildContext context,
    TasksFilter filter,
    String label,
    bool isSelected,
  ) {
    final themeColor = isSelected ? AppColors.primaryColor : Colors.white;
    final textColor = isSelected ? Colors.white : AppColors.textMuted;
    final border = isSelected
        ? Border.all(color: Colors.black.withValues(alpha: 0.08), width: 1.5)
        : Border.all(color: AppColors.borderLight);

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () => context.read<TasksBloc>().add(FilterChanged(filter)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: themeColor,
            borderRadius: BorderRadius.circular(20),
            border: border,
            boxShadow: isSelected ? AppTheme.buttonShadow : AppTheme.cardShadow,
          ),
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
