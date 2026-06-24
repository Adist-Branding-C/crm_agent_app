import '../models/analytics_models.dart';
import '../models/analytics_deal_models.dart';
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

  @override
  Future<LeadsSummary> getLeadsSummary(AnalyticsFilterParams p) async {
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.calculateLeadsSummary(
      AnalyticsCalculationHelper.filterLeads(
        leads,
        p.statuses,
        p.sources,
        p.period,
      ),
    );
  }

  @override
  Future<DealsSummary> getDealsSummary(AnalyticsFilterParams p) async {
    final deals = await dealsRepository.getDeals();
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.calculateDealsSummary(
      AnalyticsCalculationHelper.filterDeals(
        deals,
        leads,
        p.statuses,
        p.sources,
        p.period,
      ),
    );
  }

  @override
  Future<List<StatusMetric>> getLeadsByStatus(AnalyticsFilterParams p) async {
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.calculateStatusMetrics(
      AnalyticsCalculationHelper.filterLeads(
        leads,
        p.statuses,
        p.sources,
        p.period,
      ),
    );
  }

  @override
  Future<List<SourceMetric>> getLeadsBySource(AnalyticsFilterParams p) async {
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.calculateSourceMetrics(
      AnalyticsCalculationHelper.filterLeads(
        leads,
        p.statuses,
        p.sources,
        p.period,
      ),
    );
  }

  @override
  Future<List<DealStageMetric>> getDealsByStage(AnalyticsFilterParams p) async {
    final deals = await dealsRepository.getDeals();
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.calculateDealStageMetrics(
      AnalyticsCalculationHelper.filterDeals(
        deals,
        leads,
        p.statuses,
        p.sources,
        p.period,
      ),
    );
  }

  @override
  Future<List<PipelineValueStageMetric>> getPipelineValueByStage(
    AnalyticsFilterParams p,
  ) async {
    final deals = await dealsRepository.getDeals();
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.calculatePipelineValueStageMetrics(
      AnalyticsCalculationHelper.filterDeals(
        deals,
        leads,
        p.statuses,
        p.sources,
        p.period,
      ),
    );
  }

  @override
  Future<List<DealTypeMetric>> getValueByDealType(
    AnalyticsFilterParams p,
  ) async {
    final deals = await dealsRepository.getDeals();
    final leads = await leadsRepository.getLeads();
    return AnalyticsCalculationHelper.calculateDealTypeMetrics(
      AnalyticsCalculationHelper.filterDeals(
        deals,
        leads,
        p.statuses,
        p.sources,
        p.period,
      ),
    );
  }
}
