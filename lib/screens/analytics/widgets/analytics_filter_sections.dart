import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import 'filter_date_range_section.dart';
import 'filter_chips_section.dart';
import '../../../theme.dart';

class AnalyticsFilterSections extends StatelessWidget {
  final String period; final DateTime? start, end;
  final ValueChanged<String> onPeriodChanged;
  final ValueChanged<DateTime?> onStartDateChanged, onEndDateChanged;
  final Set<LeadStatus> statuses; final Set<LeadSource> sources;
  final ValueChanged<LeadStatus> onStatusToggle;
  final ValueChanged<LeadSource> onSourceToggle;

  const AnalyticsFilterSections({
    super.key,
    required this.period, this.start, this.end,
    required this.onPeriodChanged, required this.onStartDateChanged, required this.onEndDateChanged,
    required this.statuses, required this.sources,
    required this.onStatusToggle, required this.onSourceToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        FilterDateRangeSection(selectedPeriod: period, startDate: start, endDate: end, onPeriodChanged: onPeriodChanged, onStartDateChanged: onStartDateChanged, onEndDateChanged: onEndDateChanged),
        AppSpacing.gapXl,
        FilterChipsSection<LeadStatus>(title: 'Lead Status', options: LeadStatus.values, labelBuilder: (s) => s.label, selectedValues: statuses, onToggle: onStatusToggle),
        AppSpacing.gapXl,
        FilterChipsSection<LeadSource>(title: 'Source', options: LeadSource.values, labelBuilder: (s) => s.label, selectedValues: sources, onToggle: onSourceToggle),
        AppSpacing.gapXxl,
      ]),
    );
  }
}
