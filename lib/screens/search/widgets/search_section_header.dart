import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Styled header for categories on the search suggestion and results screens.
class SearchSectionHeader extends StatelessWidget {
  final String title;

  const SearchSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 16, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.textMuted,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
