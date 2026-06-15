import 'package:flutter/material.dart';

/// Styled checkbox representing task completion.
class TaskCheckbox extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onTap;

  /// Creates a constant [TaskCheckbox].
  const TaskCheckbox({
    super.key,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: isChecked ? const Color(0xFF10B981) : Colors.white,
          border: Border.all(
            color: isChecked ? Colors.transparent : const Color(0xFFCBD5E1),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: isChecked
            ? const Icon(
                Icons.check_rounded,
                size: 14,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
