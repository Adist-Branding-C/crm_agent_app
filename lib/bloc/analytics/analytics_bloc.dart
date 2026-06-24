import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/analytics_repository.dart';
import '../../data/repositories/analytics_filter_params.dart';
import '../leads/leads_enums.dart';
import 'analytics_tab_data.dart';

export 'analytics_event.dart';
export 'analytics_state.dart';
import 'analytics_event.dart';
import 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final AnalyticsRepository analyticsRepository;

  AnalyticsBloc({required this.analyticsRepository})
    : super(const AnalyticsInitial()) {
    on<LoadAnalytics>(_onLoad);
    on<ChangeTab>(_onChangeTab);
    on<ChangePeriod>(_onChangePeriod);
    on<ApplyFilters>(_onApplyFilters);
  }

  AnalyticsFilterParams _params({
    String period = 'This Month',
    DateTime? start,
    DateTime? end,
    Set<LeadStatus>? statuses,
    Set<LeadSource>? sources,
  }) => AnalyticsFilterParams(
    period: period,
    startDate: start,
    endDate: end,
    statuses: statuses ?? LeadStatus.values.toSet(),
    sources: sources ?? LeadSource.values.toSet(),
  );

  Future<void> _onLoad(
    LoadAnalytics event,
    Emitter<AnalyticsState> emit,
  ) async {
    emit(const AnalyticsLoading());
    await _fetch(AnalyticsTab.leads, _params(), emit);
  }

  void _onChangeTab(ChangeTab event, Emitter<AnalyticsState> emit) {
    if (state is AnalyticsLoaded) {
      final s = state as AnalyticsLoaded;
      emit(
        AnalyticsLoaded(
          activeTab: event.tab,
          selectedPeriod: s.selectedPeriod,
          customStartDate: s.customStartDate,
          customEndDate: s.customEndDate,
          selectedStatuses: s.selectedStatuses,
          selectedSources: s.selectedSources,
          leadsData: s.leadsData,
          dealsData: s.dealsData,
        ),
      );
    }
  }

  Future<void> _onChangePeriod(
    ChangePeriod event,
    Emitter<AnalyticsState> emit,
  ) async {
    if (state is AnalyticsLoaded) {
      final s = state as AnalyticsLoaded;
      emit(const AnalyticsLoading());
      await _fetch(
        s.activeTab,
        _params(
          period: event.period,
          statuses: s.selectedStatuses,
          sources: s.selectedSources,
        ),
        emit,
      );
    }
  }

  Future<void> _onApplyFilters(
    ApplyFilters event,
    Emitter<AnalyticsState> emit,
  ) async {
    if (state is AnalyticsLoaded) {
      final s = state as AnalyticsLoaded;
      emit(const AnalyticsLoading());
      await _fetch(
        s.activeTab,
        _params(
          period: event.period,
          start: event.startDate,
          end: event.endDate,
          statuses: event.statuses,
          sources: event.sources,
        ),
        emit,
      );
    }
  }

  Future<void> _fetch(
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
