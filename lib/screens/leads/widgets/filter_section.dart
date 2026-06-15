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
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        child,
        const SizedBox(height: 16),
      ],
    );
  }
}
