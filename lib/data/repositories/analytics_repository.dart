import '../../bloc/analytics/analytics_models.dart';
import '../../bloc/analytics/deal_analytics_models.dart';
import '../../bloc/leads/leads_enums.dart';

/// Repository interface managing Analytics metrics.
abstract class AnalyticsRepository {
  /// Fetches top-level leads summary metrics.
  Future<LeadsSummary> getLeadsSummary(
    Set<LeadStatus> statuses, Set<LeadSource> sources, String period, [
    DateTime? startDate, DateTime? endDate,
  ]);

  /// Fetches top-level deals summary metrics.
  Future<DealsSummary> getDealsSummary(
    Set<LeadStatus> statuses, Set<LeadSource> sources, String period, [
    DateTime? startDate, DateTime? endDate,
  ]);

  /// Fetches lead distribution breakdown by status.
  Future<List<StatusMetric>> getLeadsByStatus(
    Set<LeadStatus> statuses, Set<LeadSource> sources, String period, [
    DateTime? startDate, DateTime? endDate,
  ]);

  /// Fetches lead distribution breakdown by source.
  Future<List<SourceMetric>> getLeadsBySource(
    Set<LeadStatus> statuses, Set<LeadSource> sources, String period, [
    DateTime? startDate, DateTime? endDate,
  ]);

  /// Fetches deal distribution breakdown by stage.
  Future<List<DealStageMetric>> getDealsByStage(
    Set<LeadStatus> statuses, Set<LeadSource> sources, String period, [
    DateTime? startDate, DateTime? endDate,
  ]);

  /// ...
  /// Fetches pipeline value breakdown by stage.
  Future<List<PipelineValueStageMetric>> getPipelineValueByStage(
    Set<LeadStatus> statuses, Set<LeadSource> sources, String period, [
    DateTime? startDate, DateTime? endDate,
  ]);

  /// Fetches pipeline value breakdown by deal type.
  Future<List<DealTypeMetric>> getValueByDealType(
    Set<LeadStatus> statuses, Set<LeadSource> sources, String period, [
    DateTime? startDate, DateTime? endDate,
  ]);
}
