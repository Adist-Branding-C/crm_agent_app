import '../../bloc/analytics/analytics_models.dart';
import '../../bloc/leads/leads_enums.dart';
import 'analytics_repository.dart';

/// Concrete implementation of [AnalyticsRepository] pre-seeded with mock data.
class AnalyticsRepositoryImpl implements AnalyticsRepository {
  @override
  Future<AnalyticsSummary> getAnalyticsSummary() async {
    return const AnalyticsSummary(
      totalLeads: 312,
      conversionRate: 64.0,
      wonDeals: 11,
      pipelineValue: '₹18.40L',
    );
  }

  @override
  Future<List<StatusMetric>> getStatusMetrics() async {
    return const [
      StatusMetric(status: LeadStatus.newStatus, count: 9),
      StatusMetric(status: LeadStatus.interested, count: 14),
      StatusMetric(status: LeadStatus.qualified, count: 6),
      StatusMetric(status: LeadStatus.followUp, count: 7),
      StatusMetric(status: LeadStatus.lost, count: 2),
    ];
  }

  @override
  Future<List<SourceMetric>> getSourceMetrics() async {
    return const [
      SourceMetric(source: LeadSource.facebook, count: 38),
      SourceMetric(source: LeadSource.website, count: 24),
      SourceMetric(source: LeadSource.referral, count: 18),
      SourceMetric(source: LeadSource.instagram, count: 12),
    ];
  }
}
