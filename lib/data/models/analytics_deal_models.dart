import 'package:equatable/equatable.dart';
import 'deal_models.dart';

class DealsSummary extends Equatable {
  final double openPipelineAmount;
  final int wonDealsCount;
  final double winRate;
  final double avgDealAmount;

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

class DealStageMetric extends Equatable {
  final DealStage stage;
  final int count;

  const DealStageMetric({required this.stage, required this.count});

  @override
  List<Object?> get props => [stage, count];
}

class PipelineValueStageMetric extends Equatable {
  final DealStage stage;
  final double amount;

  const PipelineValueStageMetric({required this.stage, required this.amount});

  @override
  List<Object?> get props => [stage, amount];
}

class DealTypeMetric extends Equatable {
  final String dealType;
  final double amount;

  const DealTypeMetric({required this.dealType, required this.amount});

  @override
  List<Object?> get props => [dealType, amount];
}
