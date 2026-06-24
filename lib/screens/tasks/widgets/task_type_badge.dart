import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../bloc/tasks/tasks_models.dart';
import 'task_type_presentation_extensions.dart';
import '../../../utils/context_text_extension.dart';

/// Styled badge displaying the task category/type.
class TaskTypeBadge extends StatelessWidget {
  final TaskType type;

  /// Creates a constant [TaskTypeBadge].
  const TaskTypeBadge({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final color = type.activeColor;
    final bg = type.activeBg;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(type.icon, size: 12, color: color),
          AppSpacing.gapWXs,
          Text(
            type.label,
            style: TextStyle(color: color, fontSize: context.scaleFont(11), fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
