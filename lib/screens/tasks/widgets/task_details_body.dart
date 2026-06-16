import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/tasks_bloc.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';

class TaskDetailsBody extends StatelessWidget {
  final Task task;
  const TaskDetailsBody({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: AppColors.slate100, borderRadius: BorderRadius.circular(8)),
                child: Text(task.type.name.toUpperCase(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textMuted)),
              ),
              if (task.isOverdue && !task.isCompleted)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.errorBackground, borderRadius: BorderRadius.circular(8)),
                  child: const Text('OVERDUE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.errorColor)),
                ),
            ],
          ),
          const SizedBox(height: 20),
          Text(task.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark)),
          const SizedBox(height: 12),
          _buildMetaRow('Due Time', task.time, icon: Icons.access_time_rounded),
          _buildMetaRow('Priority', task.priority.name.toUpperCase(), icon: Icons.priority_high_rounded, color: _getPriorityColor(task.priority)),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: task.isCompleted ? AppColors.slate300 : AppColors.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () => context.read<TasksBloc>().add(ToggleTaskCompletion(task.id)),
              icon: Icon(task.isCompleted ? Icons.check_circle_outline_rounded : Icons.check_circle_rounded),
              label: Text(task.isCompleted ? 'Mark Incomplete' : 'Mark Completed', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetaRow(String label, String value, {required IconData icon, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.textMuted),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontSize: 14, color: AppColors.textMuted)),
          Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color ?? AppColors.textDark)),
        ],
      ),
    );
  }

  Color _getPriorityColor(TaskPriority priority) {
    if (priority == TaskPriority.high) return AppColors.errorColor;
    if (priority == TaskPriority.medium) return AppColors.warningText;
    return AppColors.success;
  }
}
