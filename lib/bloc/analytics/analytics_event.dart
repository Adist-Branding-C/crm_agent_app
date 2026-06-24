import 'package:equatable/equatable.dart';
import '../leads/leads_enums.dart';
import 'analytics_state.dart';

/// Base class for all events handled by the [AnalyticsBloc].
abstract class AnalyticsEvent extends Equatable {
  const AnalyticsEvent();

  @override
  List<Object?> get props => [];
}

/// Event dispatched to trigger fetching/loading of analytics data.
class LoadAnalytics extends AnalyticsEvent {
  const LoadAnalytics();
}

/// Event dispatched when the active tab is switched.
class ChangeTab extends AnalyticsEvent {
  final AnalyticsTab tab;
  const ChangeTab(this.tab);

  @override
  List<Object?> get props => [tab];
}

/// Event dispatched when the time period filter is changed.
class ChangePeriod extends AnalyticsEvent {
  final String period;
  const ChangePeriod(this.period);

  @override
  List<Object?> get props => [period];
}

/// Event dispatched when new filters are applied from the bottom sheet.
class ApplyFilters extends AnalyticsEvent {
  final String period;
  final DateTime? startDate;
  final DateTime? endDate;
  final Set<LeadStatus> statuses;
  final Set<LeadSource> sources;

  const ApplyFilters({
    required this.period,
    this.startDate,
    this.endDate,
    required this.statuses,
    required this.sources,
  });

  @override
  List<Object?> get props => [period, startDate, endDate, statuses, sources];
}
