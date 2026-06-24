import '../../bloc/leads/leads_enums.dart';

class AnalyticsFilterParams {
  final Set<LeadStatus> statuses;
  final Set<LeadSource> sources;
  final String period;
  final DateTime? startDate;
  final DateTime? endDate;

  const AnalyticsFilterParams({
    this.statuses = const {},
    this.sources = const {},
    this.period = 'This Month',
    this.startDate,
    this.endDate,
  });
}
