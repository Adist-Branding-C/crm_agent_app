import '../models/analytics_deal_models.dart';
import '../models/deal_models.dart';
import 'deal_type_calculator.dart';

/// Calculator for generating deal metrics and pipeline values.
class DealsAnalyticsCalculator {
  DealsAnalyticsCalculator._();

  /// Calculates the high-level summary metrics of all deals.
  static DealsSummary calculateDealsSummary(List<Deal> deals) {
    final won = deals.where((d) => d.stage == DealStage.won).length;
    final totalAmt = deals.fold(0.0, (s, d) => s + d.amount);
    return DealsSummary(
      openPipelineAmount: deals
          .where((d) => d.stage != DealStage.won)
          .fold(0.0, (s, d) => s + d.amount),
      wonDealsCount: won,
      winRate: deals.isNotEmpty ? (won / deals.length) * 100 : 0.0,
      avgDealAmount: deals.isNotEmpty ? totalAmt / deals.length : 0.0,
    );
  }

  /// Calculates deal count grouped by stage.
  static List<DealStageMetric> calculateDealStageMetrics(List<Deal> deals) {
    return DealStage.values
        .map(
          (s) => DealStageMetric(
            stage: s,
            count: deals.where((d) => d.stage == s).length,
          ),
        )
        .toList();
  }

  /// Calculates total pipeline financial value grouped by stage.
  static List<PipelineValueStageMetric> calculatePipelineValueStageMetrics(
    List<Deal> deals,
  ) {
    return DealStage.values
        .map(
          (s) => PipelineValueStageMetric(
            stage: s,
            amount: deals
                .where((d) => d.stage == s)
                .fold(0.0, (sum, d) => sum + d.amount),
          ),
        )
        .toList();
  }

  /// Computes deal type breakdown (distribution).
  static List<DealTypeMetric> calculateDealTypeMetrics(List<Deal> deals) =>
      computeDealTypeMetrics(deals);
}
