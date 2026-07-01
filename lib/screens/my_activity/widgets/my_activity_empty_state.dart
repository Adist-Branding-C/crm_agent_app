import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Displays an empty state when no activities match filters.
class MyActivityEmptyState extends StatelessWidget {
  const MyActivityEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.huge + AppSpacing.sm,
        ),
        child: Text(
          'No activity found for the selected filters.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textMuted,
          ),
        ),
      ),
    );
  }
}
