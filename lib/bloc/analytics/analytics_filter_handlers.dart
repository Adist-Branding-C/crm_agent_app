import 'package:flutter_bloc/flutter_bloc.dart';
import 'analytics_bloc.dart';
import 'analytics_event.dart';
import 'analytics_state.dart';
import 'analytics_query_handlers.dart';

/// Extension defining tab and filter change handlers for [AnalyticsBloc].
extension AnalyticsFilterHandlers on AnalyticsBloc {
  /// Handler to toggle active dashboard tab.
  void onChangeTab(ChangeTab event, Emitter<AnalyticsState> emit) {
    final s = state;
    if (s is AnalyticsLoaded) {
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

  /// Handler to change select period view.
  Future<void> onChangePeriod(
    ChangePeriod event,
    Emitter<AnalyticsState> emit,
  ) async {
    final s = state;
    if (s is AnalyticsLoaded) {
      emit(const AnalyticsLoading());
      await fetch(
        s.activeTab,
        params(
          period: event.period,
          statuses: s.selectedStatuses,
          sources: s.selectedSources,
        ),
        emit,
      );
    }
  }

  /// Handler to apply custom status and source filters.
  Future<void> onApplyFilters(
    ApplyFilters event,
    Emitter<AnalyticsState> emit,
  ) async {
    final s = state;
    if (s is AnalyticsLoaded) {
      emit(const AnalyticsLoading());
      await fetch(
        s.activeTab,
        params(
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
}
