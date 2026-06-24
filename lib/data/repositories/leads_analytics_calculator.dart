import '../models/analytics_models.dart';
import '../models/lead_enums.dart';
import '../models/lead_models.dart';

/// Calculator for generating lead metrics and summaries.
class LeadsAnalyticsCalculator {
  LeadsAnalyticsCalculator._();

  /// Calculates the high-level summary metrics of all leads.
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

  /// Calculates lead count grouped by status.
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

  /// Calculates lead count grouped by source.
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
}
