part of 'my_activity_bloc.dart';

/// Extension containing event handlers for [MyActivityBloc].
extension MyActivityHandlers on MyActivityBloc {
  Future<void> onLoadMyActivity(
    LoadMyActivity event,
    Emitter<MyActivityState> emit,
  ) async {
    emit(const MyActivityLoading());
    try {
      final items = repository.getAllActivities();
      final loadedLeads = await leadsRepository.getLeads();
      final leads = loadedLeads.map((l) => l.name).toList()..sort();
      final filtered = applyActivityFilters(
        items,
        timeFilter: ActivityTimeFilter.all,
        typeFilter: ActivityTypeFilter.all,
        leadFilter: 'All leads',
      );
      final grouped = groupByDate(filtered);
      emit(MyActivityLoaded(
        groupedActivities: grouped,
        totalCount: _countItems(grouped),
        selectedTimeFilter: ActivityTimeFilter.all,
        selectedTypeFilter: ActivityTypeFilter.all,
        selectedLead: 'All leads',
        availableLeads: leads,
      ));
    } catch (e) {
      emit(MyActivityError(e.toString()));
    }
  }

  void onTimeFilterChanged(
    TimeFilterChanged event, Emitter<MyActivityState> emit,
  ) {
    final cur = state;
    if (cur is! MyActivityLoaded) return;
    _emitFiltered(emit, cur.copyWith(selectedTimeFilter: event.filter));
  }

  void onTypeFilterChanged(
    TypeFilterChanged event, Emitter<MyActivityState> emit,
  ) {
    final cur = state;
    if (cur is! MyActivityLoaded) return;
    _emitFiltered(emit, cur.copyWith(selectedTypeFilter: event.type));
  }

  void onLeadFilterChanged(
    LeadFilterChanged event, Emitter<MyActivityState> emit,
  ) {
    final cur = state;
    if (cur is! MyActivityLoaded) return;
    _emitFiltered(emit, cur.copyWith(selectedLead: event.leadName));
  }

  void _emitFiltered(
    Emitter<MyActivityState> emit, MyActivityLoaded current,
  ) {
    final items = repository.getAllActivities();
    final filtered = applyActivityFilters(
      items,
      timeFilter: current.selectedTimeFilter,
      typeFilter: current.selectedTypeFilter,
      leadFilter: current.selectedLead,
    );
    final grouped = groupByDate(filtered);
    emit(current.copyWith(
      groupedActivities: grouped,
      totalCount: _countItems(grouped),
    ));
  }

  int _countItems(List<ActivityDateGroup> groups) =>
      groups.fold(0, (sum, g) => sum + g.items.length);
}
