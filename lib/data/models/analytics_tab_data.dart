import 'package:equatable/equatable.dart';
import 'analytics_models.dart';
import 'analytics_deal_models.dart';

class LeadsTabData extends Equatable {
  final LeadsSummary summary;
  final List<StatusMetric> statusMetrics;
  final List<SourceMetric> sourceMetrics;

  const LeadsTabData({
    required this.summary,
    required this.statusMetrics,
    required this.sourceMetrics,
  });

  @override
  List<Object?> get props => [summary, statusMetrics, sourceMetrics];
}

class DealsTabData extends Equatable {
  final DealsSummary summary;
  final List<DealStageMetric> stageMetrics;
  final List<PipelineValueStageMetric> pipelineMetrics;
  final List<DealTypeMetric> typeMetrics;

  const DealsTabData({
    required this.summary,
    required this.stageMetrics,
    required this.pipelineMetrics,
    required this.typeMetrics,
  });

  @override
  List<Object?> get props => [summary, stageMetrics, pipelineMetrics, typeMetrics];
}
