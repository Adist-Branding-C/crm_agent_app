import 'package:flutter_sfs/flutter_sfs.dart';

import '../../../theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Styled checkbox representing task completion.
class TaskCheckbox extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onTap;

  /// Creates a constant [TaskCheckbox].
  const TaskCheckbox({super.key, required this.isChecked, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 18.w,
        height: 35.h,
        decoration: BoxDecoration(
          color: isChecked ? AppColors.success : Colors.white,
          border: Border.all(
            color: isChecked ? Colors.transparent : AppColors.slate300,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: isChecked
            ?  Icon(Icons.check_rounded, size: 14.s, color: Colors.white)
            : null,
      ),
    );
  }
}
