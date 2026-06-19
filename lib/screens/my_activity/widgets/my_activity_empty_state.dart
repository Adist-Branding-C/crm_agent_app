import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Displays an empty state when no activities match filters.
class MyActivityEmptyState extends StatelessWidget {
  const MyActivityEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 48),
        child: Text(
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
