import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Section wrapper for filter options with styled heading.
class FilterSection extends StatelessWidget {
  /// Header title for the section.
  final String title;

  /// Child widget rendering options.
  final Widget child;

  /// Creates a constant [FilterSection].
  const FilterSection({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.sm),
          child: Text(
            title,
            style:  TextStyle(
              color: AppColors.textMuted,
              fontSize: 10.s,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        child,
        AppSpacing.gapLg,
      ],
    );
  }
}
