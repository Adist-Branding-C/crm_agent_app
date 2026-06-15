import 'analytics_models.dart';

/// Mock data for top-level analytics metrics.
const AnalyticsSummary mockAnalyticsSummary = AnalyticsSummary(
  totalLeads: 312,
  conversionRate: 64.0,
  wonDeals: 11,
  pipelineValue: '₹18.40L',
);

/// Mock list of status metrics.
const List<StatusMetric> mockStatusMetrics = [
  StatusMetric(status: 'New', count: 9),
  StatusMetric(status: 'Interested', count: 14),
  StatusMetric(status: 'Qualified', count: 6),
  StatusMetric(status: 'Follow Up', count: 7),
  StatusMetric(status: 'Lost', count: 2),
];

/// Mock list of source metrics.
const List<SourceMetric> mockSourceMetrics = [
  SourceMetric(source: 'Facebook', count: 38),
  SourceMetric(source: 'Website', count: 24),
  SourceMetric(source: 'Referral', count: 18),
  SourceMetric(source: 'Instagram', count: 12),
];
