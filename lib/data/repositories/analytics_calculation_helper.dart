import '../models/analytics_models.dart';
import '../models/analytics_deal_models.dart';
import '../models/lead_enums.dart';
import '../models/lead_models.dart';
import '../models/deal_models.dart';
import 'leads_analytics_calculator.dart';
import 'deals_analytics_calculator.dart';

class AnalyticsCalculationHelper {
  AnalyticsCalculationHelper._();

  static List<Lead> filterLeads(
    List<Lead> leads,
    Set<LeadStatus> statuses,
    Set<LeadSource> sources,
    String period,
  ) {
    return _applyPeriod(
      leads
          .where(
            (l) =>
                statuses.contains(l.status) &&
                (l.leadSource == null || sources.contains(l.leadSource!)),
          )
          .toList(),
      period,
    );
  }

  static List<Deal> filterDeals(
    List<Deal> deals,
    List<Lead> leads,
    Set<LeadStatus> statuses,
    Set<LeadSource> sources,
    String period,
  ) {
    final list = deals.where((d) {
      final first = d.clientName.split(' ')[0].toLowerCase();
      final l = leads.cast<Lead?>().firstWhere(
        (lead) => lead!.name.toLowerCase().contains(first),
        orElse: () => null,
      );
      final matchStatus = l == null || statuses.contains(l.status);
      final matchSource =
          l == null || l.leadSource == null || sources.contains(l.leadSource!);
      return matchStatus && matchSource;
    }).toList();
    return _applyPeriod(list, period);
  }

  static List<T> _applyPeriod<T>(List<T> list, String period) {
    return list;
  }

  static LeadsSummary calculateLeadsSummary(List<Lead> leads) =>
      LeadsAnalyticsCalculator.calculateLeadsSummary(leads);

  static List<StatusMetric> calculateStatusMetrics(List<Lead> leads) =>
      LeadsAnalyticsCalculator.calculateStatusMetrics(leads);

  static List<SourceMetric> calculateSourceMetrics(List<Lead> leads) =>
      LeadsAnalyticsCalculator.calculateSourceMetrics(leads);

  static DealsSummary calculateDealsSummary(List<Deal> deals) =>
      DealsAnalyticsCalculator.calculateDealsSummary(deals);

  static List<DealStageMetric> calculateDealStageMetrics(List<Deal> deals) =>
      DealsAnalyticsCalculator.calculateDealStageMetrics(deals);

  static List<PipelineValueStageMetric> calculatePipelineValueStageMetrics(
    List<Deal> deals,
  ) =>
      DealsAnalyticsCalculator.calculatePipelineValueStageMetrics(deals);

  static List<DealTypeMetric> calculateDealTypeMetrics(List<Deal> deals) =>
      DealsAnalyticsCalculator.calculateDealTypeMetrics(deals);
}
