import 'package:flutter/material.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../theme.dart';

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
    final (icon, activeColor, activeBg) = _getConfig(type);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? activeBg : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? activeColor : AppColors.slate300,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? activeColor : AppColors.textMuted,
            ),
            const SizedBox(width: 6),
            Text(
              type.label,
              style: TextStyle(
                color: isSelected ? activeColor : AppColors.textMuted,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  (IconData, Color, Color) _getConfig(TaskType type) {
    return switch (type) {
      TaskType.task => (
          Icons.check_box_outlined,
          const Color(0xFF3B82F6),
          const Color(0xFFEFF6FF),
        ),
      TaskType.meeting => (
          Icons.people_outline_rounded,
          const Color(0xFF8B5CF6),
          const Color(0xFFF5F3FF),
        ),
      TaskType.call => (
          Icons.phone_outlined,
          const Color(0xFF10B981),
          const Color(0xFFECFDF5),
        ),
      TaskType.deal => (
          Icons.business_center_outlined,
          const Color(0xFFF59E0B),
          const Color(0xFFFFFBEB),
        ),
    };
  }
}
