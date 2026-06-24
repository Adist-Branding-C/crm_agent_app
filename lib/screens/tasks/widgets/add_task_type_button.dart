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
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.ten),
        decoration: BoxDecoration(
          color: isSelected ? type.activeBg : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? type.activeColor : AppColors.slate300,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              type.icon,
              size: 16,
              color: isSelected ? type.activeColor : AppColors.textMuted,
            ),
            SizedBox(width: AppSpacing.xs2),
            Text(
              type.label,
              style: TextStyle(
                color: isSelected ? type.activeColor : AppColors.textMuted,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
