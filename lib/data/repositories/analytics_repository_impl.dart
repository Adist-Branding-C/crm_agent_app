import '../models/analytics_models.dart';
import '../models/analytics_deal_models.dart';
import '../models/lead_enums.dart';
import 'analytics_calculation_helper.dart';
import 'analytics_repository.dart';
import 'leads_repository.dart';
import 'deals_repository.dart';

/// Concrete implementation of [AnalyticsRepository] using live lead and deal data.
class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final LeadsRepository leadsRepository;
  final DealsRepository dealsRepository;

  AnalyticsRepositoryImpl({
    required this.leadsRepository,
    required this.dealsRepository,
  });

  @override
  Future<LeadsSummary> getLeadsSummary(Set<LeadStatus> sts, Set<LeadSource> srcs, String p, [DateTime? s, DateTime? e]) async {
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.calculateLeadsSummary(
        AnalyticsCalculationHelper.filterLeads(leads, sts, srcs, p));
  }

  @override
  Future<DealsSummary> getDealsSummary(Set<LeadStatus> sts, Set<LeadSource> srcs, String p, [DateTime? s, DateTime? e]) async {
    final deals = await dealsRepository.getDeals();
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.calculateDealsSummary(
        AnalyticsCalculationHelper.filterDeals(deals, leads, sts, srcs, p));
  }

  @override
  Future<List<StatusMetric>> getLeadsByStatus(Set<LeadStatus> sts, Set<LeadSource> srcs, String p, [DateTime? s, DateTime? e]) async {
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.calculateStatusMetrics(
        AnalyticsCalculationHelper.filterLeads(leads, sts, srcs, p));
  }

  @override
  Future<List<SourceMetric>> getLeadsBySource(Set<LeadStatus> sts, Set<LeadSource> srcs, String p, [DateTime? s, DateTime? e]) async {
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.calculateSourceMetrics(
        AnalyticsCalculationHelper.filterLeads(leads, sts, srcs, p));
  }

  @override
  Future<List<DealStageMetric>> getDealsByStage(Set<LeadStatus> sts, Set<LeadSource> srcs, String p, [DateTime? s, DateTime? e]) async {
    final deals = await dealsRepository.getDeals();
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.calculateDealStageMetrics(
        AnalyticsCalculationHelper.filterDeals(deals, leads, sts, srcs, p));
  }

  @override
  Future<List<PipelineValueStageMetric>> getPipelineValueByStage(Set<LeadStatus> sts, Set<LeadSource> srcs, String p, [DateTime? s, DateTime? e]) async {
    final deals = await dealsRepository.getDeals();
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.calculatePipelineValueStageMetrics(
        AnalyticsCalculationHelper.filterDeals(deals, leads, sts, srcs, p));
  }

  @override
  Future<List<DealTypeMetric>> getValueByDealType(Set<LeadStatus> sts, Set<LeadSource> srcs, String p, [DateTime? s, DateTime? e]) async {
    final deals = await dealsRepository.getDeals();
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.calculateDealTypeMetrics(
        AnalyticsCalculationHelper.filterDeals(deals, leads, sts, srcs, p));
  }
}
