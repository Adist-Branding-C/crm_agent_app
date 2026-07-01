import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../theme.dart';

/// Renders a detail information row with an icon and label text.
class TaskDetailsInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const TaskDetailsInfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16.s, color: AppColors.textMuted),
        SizedBox(width: AppSpacing.sm),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textDark,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}

/// Action button inside the task details bottom sheet.
class TaskDetailsActionBtn extends StatelessWidget {
  final String taskId;
  final bool isCompleted;

  const TaskDetailsActionBtn({
    super.key,
    required this.taskId,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.0.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isCompleted ? AppColors.slate300 : AppColors.success,
          foregroundColor: Colors.white,
          padding:  EdgeInsets.symmetric(vertical: 14.0.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r),
          ),
          elevation: 0,
        ),
        onPressed: isCompleted
            ? null
            : () {
                context.read<TasksBloc>().add(ToggleTaskCompletion(taskId));
                Navigator.pop(context);
              },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(Icons.check, size:   20.s),
            SizedBox(width: AppSpacing.sm),
            Text(
              isCompleted ? 'Completed' : 'Mark complete',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
