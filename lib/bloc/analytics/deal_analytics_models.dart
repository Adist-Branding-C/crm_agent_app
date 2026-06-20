import 'package:equatable/equatable.dart';
import '../deals/deals_models.dart';

/// Summarized top-level metrics for deals.
class DealsSummary extends Equatable {
  /// Total value of all open deals.
  final double openPipelineAmount;

  /// Total count of won deals.
  final int wonDealsCount;

  /// Win rate percentage (e.g. 14.0 for 14%).
  final double winRate;

  /// Average amount per deal.
  final double avgDealAmount;

  /// Creates a constant [DealsSummary].
  const DealsSummary({
    required this.openPipelineAmount,
    required this.wonDealsCount,
    required this.winRate,
    required this.avgDealAmount,
  });

  @override
  List<Object?> get props => [
        openPipelineAmount,
        wonDealsCount,
        winRate,
        avgDealAmount,
      ];
}

/// Represents a single deal stage metric.
class DealStageMetric extends Equatable {
  /// The deal stage enum.
  final DealStage stage;

  /// Count of deals in this stage.
  final int count;

  /// Creates a constant [DealStageMetric].
  const DealStageMetric({required this.stage, required this.count});

  @override
  List<Object?> get props => [stage, count];
}

/// Represents a pipeline value segmented by stage.
class PipelineValueStageMetric extends Equatable {
  /// The deal stage enum.
  final DealStage stage;

  /// Total value amount of deals in this stage.
  final double amount;

  /// Creates a constant [PipelineValueStageMetric].
  const PipelineValueStageMetric({required this.stage, required this.amount});

  @override
  List<Object?> get props => [stage, amount];
}

/// Represents a pipeline value segmented by deal type.
class DealTypeMetric extends Equatable {
  /// Name of the deal type (e.g. "New Admission", "Corporate", "Enquiry").
  final String dealType;

  /// Total value amount of deals for this type.
  final double amount;

  /// Creates a constant [DealTypeMetric].
  const DealTypeMetric({required this.dealType, required this.amount});

  @override
  List<Object?> get props => [dealType, amount];
}
