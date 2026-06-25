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
        child: const Text(
          'No activity found for the selected filters.',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
