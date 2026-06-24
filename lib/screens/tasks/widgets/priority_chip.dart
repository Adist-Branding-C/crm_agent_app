import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../widgets/colored_dot.dart';
import 'task_priority_extensions.dart';

class PriorityChip extends StatelessWidget {
  final TaskPriority priority;
  final bool isSelected;
  final VoidCallback onTap;

  const PriorityChip({
    super.key,
    required this.priority,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dotColor = priority == TaskPriority.low
        ? AppColors.slate400
        : priority.displayColor;
    final activeBg = switch (priority) {
      TaskPriority.high => AppColors.errorBackground,
      TaskPriority.medium => AppColors.warningTextBackground,
      TaskPriority.low => AppColors.slate100,
    };

    return Padding(
      padding: EdgeInsets.only(right: AppSpacing.md),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: isSelected ? activeBg : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? priority.displayColor : AppColors.slate300,
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ColoredDot(color: dotColor, size: 8),
              AppSpacing.gapWSm,
              Text(
                priority.label,
                style: TextStyle(
                  color: isSelected
                      ? priority.displayColor
                      : AppColors.textMuted,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
