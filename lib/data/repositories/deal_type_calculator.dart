import '../models/analytics_deal_models.dart';
import '../models/deal_models.dart';

List<DealTypeMetric> computeDealTypeMetrics(List<Deal> deals) {
  const types = ['New Admission', 'Corporate', 'Enquiry'];
  return types.map((t) {
    final amt = deals.where((d) {
      final type = d.title.toLowerCase().contains('corporate')
          ? 'Corporate'
          : (d.stage == DealStage.newStage ? 'Enquiry' : 'New Admission');
      return type == t;
    }).fold(0.0, (sum, d) => sum + d.amount);
    return DealTypeMetric(dealType: t, amount: amt);
  }).toList();
}
