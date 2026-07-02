import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../theme.dart';
import '../../../widgets/bottom_sheet_handle.dart';
import 'filter_action_buttons.dart';
import 'analytics_filter_sections.dart';

class AnalyticsFilterSheetBody extends StatelessWidget {
  final String period;
  final DateTime? start;
  final DateTime? end;
  final Set<LeadStatus> statuses;
  final Set<LeadSource> sources;
  final ValueChanged<String> onPeriodChanged;
  final ValueChanged<DateTime?> onStartDateChanged;
  final ValueChanged<DateTime?> onEndDateChanged;
  final ValueChanged<LeadStatus> onStatusToggle;
  final ValueChanged<LeadSource> onSourceToggle;
  final VoidCallback onReset;
  final VoidCallback onApply;

  const AnalyticsFilterSheetBody({
    super.key,
    required this.period,
    this.start,
    this.end,
    required this.statuses,
    required this.sources,
    required this.onPeriodChanged,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    required this.onStatusToggle,
    required this.onSourceToggle,
    required this.onReset,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      padding: EdgeInsets.fromLTRB(AppSpacing.xl, 20.0.h, AppSpacing.xl, 20.0.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: BottomSheetHandle()),
          AppSpacing.gapLg,
          Text(
            'Filter analytics',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          AppSpacing.gapXl,
          Flexible(
            child: AnalyticsFilterSections(
              period: period,
              start: start,
              end: end,
              onPeriodChanged: onPeriodChanged,
              onStartDateChanged: onStartDateChanged,
              onEndDateChanged: onEndDateChanged,
              statuses: statuses,
              sources: sources,
              onStatusToggle: onStatusToggle,
              onSourceToggle: onSourceToggle,
            ),
          ),
          FilterActionButtons(onReset: onReset, onApply: onApply),
        ],
      ),
    );
  }
}
