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
    final sources = LeadSource.values.where((e) => e != LeadSource.googleAds).toList();
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: sources.map((src) {
        final isSel = selectedSource == src;
        return GestureDetector(
          onTap: () => onSelected(isSel ? null : src),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isSel ? AppColors.primaryColor : const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              src.label,
              style: TextStyle(
                color: isSel ? Colors.white : const Color(0xFF475569),
                fontSize: 13,
                fontWeight: isSel ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
