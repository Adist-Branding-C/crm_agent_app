import 'package:flutter/material.dart';
import '../../../bloc/tasks/tasks_models.dart';

/// Styled badge displaying the task category/type.
class TaskTypeBadge extends StatelessWidget {
  final TaskType type;

  /// Creates a constant [TaskTypeBadge].
  const TaskTypeBadge({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final (icon, color, bg) = switch (type) {
      TaskType.task => (
          Icons.check_box_outlined,
          const Color(0xFF3B82F6),
          const Color(0xFFEFF6FF)
        ),
      TaskType.meeting => (
          Icons.people_outline_rounded,
          const Color(0xFF8B5CF6),
          const Color(0xFFF5F3FF)
        ),
      TaskType.call => (
          Icons.phone_outlined,
          const Color(0xFF10B981),
          const Color(0xFFECFDF5)
        ),
      TaskType.deal => (
          Icons.business_center_outlined,
          const Color(0xFFF59E0B),
          const Color(0xFFFFFBEB)
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            type.label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
