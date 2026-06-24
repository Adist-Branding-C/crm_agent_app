import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../theme.dart';

/// Segmented sort controller selecting 'Newest', 'Oldest', 'A-Z', or 'Follow-up'.
class FilterSortBy extends StatelessWidget {
  /// Currently selected sorting option.
  final SortLeadsBy selectedSort;

  /// Callback when a sorting option is chosen.
  final ValueChanged<SortLeadsBy> onSelected;

  /// Creates a constant [FilterSortBy].
  const FilterSortBy({
    super.key,
    required this.selectedSort,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      padding: EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.slate100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: SortLeadsBy.values.map((opt) {
          final isSel = selectedSort == opt;
          return Expanded(
            child: GestureDetector(
              onTap: () => onSelected(opt),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSel ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  opt.label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSel ? FontWeight.w600 : FontWeight.w500,
                    color: isSel ? AppColors.textDark : AppColors.textMuted,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
