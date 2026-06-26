import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/bottom_sheet_handle.dart';

/// Renders the standardized handle and title for the Tasks filter sheet.
class TasksFilterHeader extends StatelessWidget {
  const TasksFilterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BottomSheetHandle(),
        AppSpacing.gapLg,
        Text(
          'Filter Tasks',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5.w,
          ),
        ),
      ],
    );
  }
}
