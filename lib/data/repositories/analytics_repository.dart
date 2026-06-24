import '../models/analytics_models.dart';
import '../models/analytics_deal_models.dart';
import 'analytics_filter_params.dart';

/// Repository interface managing Analytics metrics.
abstract class AnalyticsRepository {
  Future<LeadsSummary> getLeadsSummary(AnalyticsFilterParams params);
  Future<DealsSummary> getDealsSummary(AnalyticsFilterParams params);
  Future<List<StatusMetric>> getLeadsByStatus(AnalyticsFilterParams params);
  Future<List<SourceMetric>> getLeadsBySource(AnalyticsFilterParams params);
  Future<List<DealStageMetric>> getDealsByStage(AnalyticsFilterParams params);
  Future<List<PipelineValueStageMetric>> getPipelineValueByStage(AnalyticsFilterParams params);
  Future<List<DealTypeMetric>> getValueByDealType(AnalyticsFilterParams params);
}
