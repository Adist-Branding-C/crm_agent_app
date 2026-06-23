import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/analytics/analytics_bloc.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/bottom_sheet_handle.dart';
import 'filter_action_buttons.dart';
import 'analytics_filter_sections.dart';

class AnalyticsFilterSheet extends StatefulWidget {
  const AnalyticsFilterSheet({super.key});
  @override
  State<AnalyticsFilterSheet> createState() => _AnalyticsFilterSheetState();
}

class _AnalyticsFilterSheetState extends State<AnalyticsFilterSheet> {
  String _period = 'This Month'; DateTime? _start; DateTime? _end;
  Set<LeadStatus> _statuses = LeadStatus.values.toSet();
  Set<LeadSource> _sources = LeadSource.values.toSet();

  @override
  void initState() {
    super.initState();
    final state = context.read<AnalyticsBloc>().state;
    if (state is AnalyticsLoaded) {
      _period = state.selectedPeriod;
      _start = state.customStartDate;
      _end = state.customEndDate;
      _statuses = Set.from(state.selectedStatuses);
      _sources = Set.from(state.selectedSources);
    }
  }

  void _reset() => setState(() {
    _period = 'This Month'; _start = null; _end = null;
    _statuses = LeadStatus.values.toSet();
    _sources = LeadSource.values.toSet();
  });

  void _apply() {
    context.read<AnalyticsBloc>().add(ApplyFilters(period: _period, startDate: _start, endDate: _end, statuses: _statuses, sources: _sources));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Center(child: BottomSheetHandle()),
        const SizedBox(height: 16),
        const _FilterTitle(),
        const SizedBox(height: 20),
        Flexible(child: AnalyticsFilterSections(
          period: _period, start: _start, end: _end,
          onPeriodChanged: (p) => setState(() => _period = p),
          onStartDateChanged: (d) => setState(() => _start = d),
          onEndDateChanged: (d) => setState(() => _end = d),
          statuses: _statuses, sources: _sources,
          onStatusToggle: (st) => setState(() => _statuses.contains(st) ? _statuses.remove(st) : _statuses.add(st)),
          onSourceToggle: (src) => setState(() => _sources.contains(src) ? _sources.remove(src) : _sources.add(src)),
        )),
        FilterActionButtons(onReset: _reset, onApply: _apply),
      ]),
    );
  }
}

class _FilterTitle extends StatelessWidget {
  const _FilterTitle();
  @override
  Widget build(BuildContext context) => Text('Filter analytics', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.textDark, fontWeight: FontWeight.bold));
}
