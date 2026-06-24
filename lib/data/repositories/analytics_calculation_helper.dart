import '../models/analytics_models.dart';
import '../models/analytics_deal_models.dart';
import '../models/lead_enums.dart';
import '../models/lead_models.dart';
import '../models/deal_models.dart';
import 'deal_type_calculator.dart';

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
    // Period filtering is a pass-through here; implement date-based
    // filtering at the data source level when timestamps are available.
    return list;
  }

  static LeadsSummary calculateLeadsSummary(List<Lead> leads) {
    final active = leads
        .where(
          (l) =>
              l.status == LeadStatus.converted ||
              l.status == LeadStatus.qualified ||
              l.status == LeadStatus.interested,
        )
        .length;
    return LeadsSummary(
      totalLeads: leads.length,
      conversionRate: leads.isNotEmpty ? (active / leads.length) * 100 : 0.0,
      interestedCount: leads
          .where((l) => l.status == LeadStatus.interested)
          .length,
      lostCount: leads.where((l) => l.status == LeadStatus.lost).length,
    );
  }

  static List<StatusMetric> calculateStatusMetrics(List<Lead> leads) {
    const sts = [
      LeadStatus.newStatus,
      LeadStatus.interested,
      LeadStatus.qualified,
      LeadStatus.followUp,
      LeadStatus.lost,
    ];
    return sts
        .map(
          (s) => StatusMetric(
            status: s,
            count: leads.where((l) => l.status == s).length,
          ),
        )
        .toList();
  }

  static List<SourceMetric> calculateSourceMetrics(List<Lead> leads) {
    const srcs = [
      LeadSource.facebook,
      LeadSource.website,
      LeadSource.referral,
      LeadSource.instagram,
      LeadSource.walkIn,
    ];
    return srcs
        .map(
          (s) => SourceMetric(
            source: s,
            count: leads.where((l) => l.leadSource == s).length,
          ),
        )
        .toList();
  }

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

  static List<DealTypeMetric> calculateDealTypeMetrics(List<Deal> deals) =>
      computeDealTypeMetrics(deals);
}
