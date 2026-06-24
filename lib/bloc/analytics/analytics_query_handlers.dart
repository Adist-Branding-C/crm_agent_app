import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/analytics_repository.dart';
import '../../data/repositories/analytics_filter_params.dart';
import '../leads/leads_enums.dart';
import 'analytics_tab_data.dart';
import 'analytics_bloc.dart';
import 'analytics_event.dart';
import 'analytics_state.dart';

/// Extension for core query and fetching operations on [AnalyticsBloc].
extension AnalyticsQueryHandlers on AnalyticsBloc {
  /// Parameter builder helper.
  AnalyticsFilterParams params({
    String period = 'This Month',
    DateTime? start,
    DateTime? end,
    Set<LeadStatus>? statuses,
    Set<LeadSource>? sources,
  }) =>
      AnalyticsFilterParams(
        period: period,
        startDate: start,
        endDate: end,
        statuses: statuses ?? LeadStatus.values.toSet(),
        sources: sources ?? LeadSource.values.toSet(),
      );

  /// Triggers initial data loading.
  Future<void> onLoad(LoadAnalytics event, Emitter<AnalyticsState> emit) async {
    emit(const AnalyticsLoading());
    await fetch(AnalyticsTab.leads, params(), emit);
  }

  /// Calls the repository and emits [AnalyticsLoaded] state.
  Future<void> fetch(
    AnalyticsTab tab,
    AnalyticsFilterParams p,
    Emitter<AnalyticsState> emit,
  ) async {
    try {
      final leads = await analyticsRepository.getLeadsSummary(p);
      final deals = await analyticsRepository.getDealsSummary(p);
      final status = await analyticsRepository.getLeadsByStatus(p);
      final source = await analyticsRepository.getLeadsBySource(p);
      final stages = await analyticsRepository.getDealsByStage(p);
      final pStages = await analyticsRepository.getPipelineValueByStage(p);
      final dTypes = await analyticsRepository.getValueByDealType(p);
      emit(
        AnalyticsLoaded(
          activeTab: tab,
          selectedPeriod: p.period,
          customStartDate: p.startDate,
          customEndDate: p.endDate,
          selectedStatuses: p.statuses,
          selectedSources: p.sources,
          leadsData: LeadsTabData(
            summary: leads,
            statusMetrics: status,
            sourceMetrics: source,
          ),
          dealsData: DealsTabData(
            summary: deals,
            stageMetrics: stages,
            pipelineMetrics: pStages,
            typeMetrics: dTypes,
          ),
        ),
      );
    } catch (_) {
      emit(const AnalyticsError(failure: AnalyticsFailure.load));
    }
  }
}
