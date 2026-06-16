import '../../bloc/analytics/analytics_models.dart';

/// Repository interface managing Analytics metrics.
abstract class AnalyticsRepository {
  /// Fetches top-level analytics summary metrics.
  Future<AnalyticsSummary> getAnalyticsSummary();

  /// Fetches lead distribution breakdown by status.
  Future<List<StatusMetric>> getStatusMetrics();

  /// Fetches lead distribution breakdown by source.
  Future<List<SourceMetric>> getSourceMetrics();
}

