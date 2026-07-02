import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/analytics/analytics_bloc.dart';
import '../../../bloc/leads/leads_enums.dart';
import 'analytics_filter_sheet_body.dart';

class AnalyticsFilterSheet extends StatefulWidget {
  const AnalyticsFilterSheet({super.key});
  @override
  State<AnalyticsFilterSheet> createState() => _AnalyticsFilterSheetState();
}

class _AnalyticsFilterSheetState extends State<AnalyticsFilterSheet> {
  String _period = 'This Month';
  DateTime? _start;
  DateTime? _end;
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
    _period = 'This Month';
    _start = null;
    _end = null;
    _statuses = LeadStatus.values.toSet();
    _sources = LeadSource.values.toSet();
  });

  void _apply() {
    context.read<AnalyticsBloc>().add(
      ApplyFilters(
        period: _period,
        startDate: _start,
        endDate: _end,
        statuses: _statuses,
        sources: _sources,
      ),
    );
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return AnalyticsFilterSheetBody(
      period: _period,
      start: _start,
      end: _end,
      statuses: _statuses,
      sources: _sources,
      onPeriodChanged: (p) => setState(() => _period = p),
      onStartDateChanged: (d) => setState(() => _start = d),
      onEndDateChanged: (d) => setState(() => _end = d),
      onStatusToggle: (st) => setState(() => _statuses.contains(st) ? _statuses.remove(st) : _statuses.add(st)),
      onSourceToggle: (src) => setState(() => _sources.contains(src) ? _sources.remove(src) : _sources.add(src)),
      onReset: _reset,
      onApply: _apply,
    );
  }
}
