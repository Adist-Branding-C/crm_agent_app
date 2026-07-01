import 'package:flutter/material.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../theme.dart';
import 'task_type_presentation_extensions.dart';

/// Renders a single selectable button for a [TaskType].
class TaskTypeButton extends StatelessWidget {
  final TaskType type;
  final bool isSelected;
  final VoidCallback onTap;

  const TaskTypeButton({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.xs2,
         
        ),
        decoration: BoxDecoration(
          color: isSelected ? type.activeBg : Colors.white,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: isSelected ? type.activeColor : AppColors.slate300,
            width: 1.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              type.icon,
              size: 13.s,
              color: isSelected ? type.activeColor : AppColors.textMuted,
            ),
            SizedBox(width: AppSpacing.xs2),
            Text(
              type.label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: isSelected ? type.activeColor : AppColors.textMuted,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
