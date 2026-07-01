import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/bottom_sheet_handle.dart';
import 'add_task_form.dart';

/// Modal bottom sheet container for the Add Task form.
class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppSpacing.gapMd,
          const BottomSheetHandle(),
          AppSpacing.gapLg,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
            child: Text(
              'New Task',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Flexible(child: AddTaskForm()),
        ],
      ),
    );
  }
}
