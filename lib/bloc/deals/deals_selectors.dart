import 'deals_bloc.dart';
import 'deals_models.dart';

/// Reusable grouping and aggregation helpers for [Deal] lists.
extension DealsGrouping on List<Deal> {
  /// Groups deals by stage.
  Map<DealStage, List<Deal>> get byStage {
    return {
      for (final stage in DealStage.values)
        stage: where((d) => d.stage == stage).toList(),
    };
  }

  /// Sum of deal amounts per stage.
  Map<DealStage, double> get stageTotals {
    final grouped = byStage;
    return {
      for (final e in grouped.entries)
        e.key: e.value.fold(0.0, (s, d) => s + d.amount),
    };
  }
}

/// Presentation selectors and aggregates for the [DealsLoaded] state.
extension DealsSelectors on DealsLoaded {
  /// The sum of all deals in the pipeline.
  double get totalPipelineValue {
    return deals.fold(0.0, (sum, deal) => sum + deal.amount);
  }

  /// The sum of won deals.
  double get wonValue {
    return deals
        .where((d) => d.stage == DealStage.won)
        .fold(0.0, (sum, deal) => sum + deal.amount);
  }
}
