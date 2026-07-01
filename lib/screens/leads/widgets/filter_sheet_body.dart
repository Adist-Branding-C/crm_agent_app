import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/bottom_sheet_handle.dart';
import '../../../../bloc/leads/filter_result.dart';
import '../../../../bloc/leads/leads_enums.dart';
import '../../../widgets/custom_button.dart';
import '../../../theme.dart';
import 'filter_section.dart';
import 'filter_sort_by.dart';
import 'filter_source.dart';
import 'filter_status.dart';

class FilterSheetBody extends StatelessWidget {
  final SortLeadsBy sortBy;
  final LeadStatus? status;
  final LeadSource? source;
  final ValueChanged<SortLeadsBy> onSortChanged;
  final ValueChanged<LeadStatus?> onStatusChanged;
  final ValueChanged<LeadSource?> onSourceChanged;
  final VoidCallback? onClear;

  const FilterSheetBody({
    super.key,
    required this.sortBy,
    required this.status,
    required this.source,
    required this.onSortChanged,
    required this.onStatusChanged,
    required this.onSourceChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.md,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BottomSheetHandle(),
          AppSpacing.gapLg,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter & Sort',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (status != null || source != null)
                TextButton(
                  onPressed: onClear,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Clear',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          AppSpacing.gapLg,
          FilterSection(
            title: 'SORT BY',
            child: FilterSortBy(
              selectedSort: sortBy,
              onSelected: onSortChanged,
            ),
          ),
          AppSpacing.gapLg,
          FilterSection(
            title: 'STATUS',
            child: FilterStatus(
              selectedStatus: status,
              onSelected: onStatusChanged,
            ),
          ),
          AppSpacing.gapLg,
          FilterSection(
            title: 'SOURCE',
            child: FilterSource(
              selectedSource: source,
              onSelected: onSourceChanged,
            ),
          ),
          AppSpacing.gapLg,
          CustomButton(
            text: 'Apply Filters',
            onPressed: () => context.pop(
              FilterResult(sortBy: sortBy, status: status, source: source),
            ),
          ),
        ],
      ),
    );
  }
}
