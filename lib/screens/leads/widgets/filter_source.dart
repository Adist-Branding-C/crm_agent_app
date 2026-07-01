import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../theme.dart';

/// Renders source channels chips: Facebook, Website, Referral, etc.
class FilterSource extends StatelessWidget {
  /// The currently selected source filter value.
  final LeadSource? selectedSource;

  /// Callback when a source is toggled.
  final ValueChanged<LeadSource?> onSelected;

  /// Creates a constant [FilterSource].
  const FilterSource({
    super.key,
    required this.selectedSource,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final sources = LeadSource.values
        .where((e) => e != LeadSource.googleAds)
        .toList();
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: sources.map((src) {
        final isSel = selectedSource == src;
        return GestureDetector(
          onTap: () => onSelected(isSel ? null : src),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.xs2,
            ),
            decoration: BoxDecoration(
              color: isSel ? AppColors.primaryColor : AppColors.slate100,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              src.label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isSel ? Colors.white : AppColors.slate600,
              fontWeight: isSel ? FontWeight.bold : FontWeight.w500,
            ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
