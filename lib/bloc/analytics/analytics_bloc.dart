import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/analytics_repository.dart';
import '../leads/leads_enums.dart';
import 'analytics_models.dart';
import 'deal_analytics_models.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final AnalyticsRepository analyticsRepository;

  AnalyticsBloc({required this.analyticsRepository}) : super(const AnalyticsInitial()) {
    on<LoadAnalytics>(_onLoad);
    on<ChangeTab>(_onChangeTab);
    on<ChangePeriod>(_onChangePeriod);
    on<ApplyFilters>(_onApplyFilters);
  }

  Future<void> _onLoad(LoadAnalytics event, Emitter<AnalyticsState> emit) async {
    emit(const AnalyticsLoading());
    await _fetch(AnalyticsTab.leads, 'This Month', null, null, LeadStatus.values.toSet(), LeadSource.values.toSet(), emit);
  }

  void _onChangeTab(ChangeTab event, Emitter<AnalyticsState> emit) {
    if (state is AnalyticsLoaded) {
      final s = state as AnalyticsLoaded;
      emit(AnalyticsLoaded(
        activeTab: event.tab, selectedPeriod: s.selectedPeriod,
        customStartDate: s.customStartDate, customEndDate: s.customEndDate,
        selectedStatuses: s.selectedStatuses, selectedSources: s.selectedSources,
        leadsSummary: s.leadsSummary, dealsSummary: s.dealsSummary,
        statusMetrics: s.statusMetrics, sourceMetrics: s.sourceMetrics,
        dealStageMetrics: s.dealStageMetrics, pipelineValueStageMetrics: s.pipelineValueStageMetrics,
        dealTypeMetrics: s.dealTypeMetrics,
      ));
    }
  }

  Future<void> _onChangePeriod(ChangePeriod event, Emitter<AnalyticsState> emit) async {
    if (state is AnalyticsLoaded) {
      final s = state as AnalyticsLoaded;
      emit(const AnalyticsLoading());
      await _fetch(s.activeTab, event.period, null, null, s.selectedStatuses, s.selectedSources, emit);
    }
  }

  Future<void> _onApplyFilters(ApplyFilters event, Emitter<AnalyticsState> emit) async {
    if (state is AnalyticsLoaded) {
      final s = state as AnalyticsLoaded;
      emit(const AnalyticsLoading());
      await _fetch(s.activeTab, event.period, event.startDate, event.endDate, event.statuses, event.sources, emit);
    }
  }

  Future<void> _fetch(AnalyticsTab tab, String period, DateTime? start, DateTime? end, Set<LeadStatus> statuses, Set<LeadSource> sources, Emitter<AnalyticsState> emit) async {
    try {
      final leads = await analyticsRepository.getLeadsSummary(statuses, sources, period, start, end);
      final deals = await analyticsRepository.getDealsSummary(statuses, sources, period, start, end);
      final status = await analyticsRepository.getLeadsByStatus(statuses, sources, period, start, end);
      final source = await analyticsRepository.getLeadsBySource(statuses, sources, period, start, end);
      final stages = await analyticsRepository.getDealsByStage(statuses, sources, period, start, end);
      final pStages = await analyticsRepository.getPipelineValueByStage(statuses, sources, period, start, end);
      final dTypes = await analyticsRepository.getValueByDealType(statuses, sources, period, start, end);
      emit(AnalyticsLoaded(
        activeTab: tab, selectedPeriod: period, customStartDate: start, customEndDate: end,
        selectedStatuses: statuses, selectedSources: sources, leadsSummary: leads, dealsSummary: deals,
        statusMetrics: status, sourceMetrics: source, dealStageMetrics: stages,
        pipelineValueStageMetrics: pStages, dealTypeMetrics: dTypes,
      ));
    } catch (_) {
      emit(const AnalyticsError(failure: AnalyticsFailure.load));
    }
  }
}
