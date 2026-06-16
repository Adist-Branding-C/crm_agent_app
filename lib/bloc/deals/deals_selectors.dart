import 'deals_bloc.dart';
import 'deals_models.dart';

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
