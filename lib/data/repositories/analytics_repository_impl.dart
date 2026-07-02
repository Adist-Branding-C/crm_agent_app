import '../models/analytics_models.dart';
import '../models/analytics_deal_models.dart';
import '../models/lead_models.dart';
import '../models/deal_models.dart';
import 'analytics_calculation_helper.dart';
import 'analytics_repository.dart';
import 'analytics_filter_params.dart';
import 'leads_repository.dart';
import 'deals_repository.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final LeadsRepository leadsRepository;
  final DealsRepository dealsRepository;

  AnalyticsRepositoryImpl({
    required this.leadsRepository,
    required this.dealsRepository,
  });

  Future<List<Lead>> _getFilteredLeads(AnalyticsFilterParams p) async {
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.filterLeads(leads, p.statuses, p.sources, p.period);
  }

  Future<List<Deal>> _getFilteredDeals(AnalyticsFilterParams p) async {
    final deals = await dealsRepository.getDeals();
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.filterDeals(deals, leads, p.statuses, p.sources, p.period);
  }

  @override
  Future<LeadsSummary> getLeadsSummary(AnalyticsFilterParams p) async {
    return AnalyticsCalculationHelper.calculateLeadsSummary(await _getFilteredLeads(p));
  }

  @override
  Future<DealsSummary> getDealsSummary(AnalyticsFilterParams p) async {
    return AnalyticsCalculationHelper.calculateDealsSummary(await _getFilteredDeals(p));
  }

  @override
  Future<List<StatusMetric>> getLeadsByStatus(AnalyticsFilterParams p) async {
    return AnalyticsCalculationHelper.calculateStatusMetrics(await _getFilteredLeads(p));
  }

  @override
  Future<List<SourceMetric>> getLeadsBySource(AnalyticsFilterParams p) async {
    return AnalyticsCalculationHelper.calculateSourceMetrics(await _getFilteredLeads(p));
  }

  @override
  Future<List<DealStageMetric>> getDealsByStage(AnalyticsFilterParams p) async {
    return AnalyticsCalculationHelper.calculateDealStageMetrics(await _getFilteredDeals(p));
  }

  @override
  Future<List<PipelineValueStageMetric>> getPipelineValueByStage(AnalyticsFilterParams p) async {
    return AnalyticsCalculationHelper.calculatePipelineValueStageMetrics(await _getFilteredDeals(p));
  }

  @override
  Future<List<DealTypeMetric>> getValueByDealType(AnalyticsFilterParams p) async {
    return AnalyticsCalculationHelper.calculateDealTypeMetrics(await _getFilteredDeals(p));
  }
}
