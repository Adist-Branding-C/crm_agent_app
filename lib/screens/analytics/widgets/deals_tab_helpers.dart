import '../../../bloc/analytics/deal_analytics_models.dart';
import '../../../utils/currency_formatter.dart';
import '../../../theme/app_colors.dart';
import '../../deals/widgets/deals_presentation_extensions.dart';
import 'metric_progress_row.dart';

int totalDealCount(List<DealStageMetric> metrics) =>
    metrics.fold<int>(0, (sum, e) => sum + e.count);

double maxPipelineValue(List<PipelineValueStageMetric> metrics) =>
    metrics.fold<double>(1.0, (max, e) => e.amount > max ? e.amount : max);

double maxTypeValue(List<DealTypeMetric> metrics) =>
    metrics.fold<double>(1.0, (max, e) => e.amount > max ? e.amount : max);

List<MetricProgressRow> buildPipelineRows(
  List<PipelineValueStageMetric> metrics,
  double maxPipeline,
) =>
    metrics.map((e) => MetricProgressRow(
      title: e.stage.label,
      count: e.amount.toRupeeFormat(),
      progressValue: maxPipeline > 0 ? e.amount / maxPipeline : 0.0,
      barColor: e.stage.color,
    )).toList();

List<MetricProgressRow> buildTypeRows(
  List<DealTypeMetric> metrics,
  double maxType,
) {
  final typeColors = [AppColors.info, AppColors.accent, AppColors.warning];
  return List.generate(metrics.length, (index) {
    final e = metrics[index];
    return MetricProgressRow(
      title: e.dealType,
      count: e.amount.toRupeeFormat(),
      progressValue: maxType > 0 ? e.amount / maxType : 0.0,
      barColor: typeColors[index % typeColors.length],
    );
  });
}
