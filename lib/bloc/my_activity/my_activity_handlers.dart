import 'package:flutter_bloc/flutter_bloc.dart';
import 'my_activity_bloc.dart';
import 'my_activity_filter_helper.dart';
import '../../data/models/my_activity/my_activity_enums.dart';
import '../../data/models/my_activity/my_activity_model.dart';

Future<void> myActivityLoad(
  MyActivityBloc bloc,
  LoadMyActivity event,
  Emitter<MyActivityState> emit,
) async {
  emit(const MyActivityLoading());
  try {
    final items = bloc.repository.getAllActivities();
    final loadedLeads = await bloc.leadsRepository.getLeads();
    final leads = loadedLeads.map((l) => l.name).toList()..sort();
    final filtered = applyActivityFilters(
      items,
      timeFilter: ActivityTimeFilter.all,
      typeFilter: ActivityTypeFilter.all,
      leadFilter: 'All leads',
    );
    final grouped = groupByDate(filtered);
    emit(
      MyActivityLoaded(
        groupedActivities: grouped,
        totalCount: _countItems(grouped),
        selectedTimeFilter: ActivityTimeFilter.all,
        selectedTypeFilter: ActivityTypeFilter.all,
        selectedLead: 'All leads',
        availableLeads: leads,
      ),
    );
  } catch (e) {
    emit(MyActivityError(e.toString()));
  }
}

void myActivityTimeFilterChanged(
  MyActivityBloc bloc,
  TimeFilterChanged event,
  Emitter<MyActivityState> emit,
) {
  final cur = bloc.state;
  if (cur is! MyActivityLoaded) return;
  _emitFiltered(bloc, emit, cur.copyWith(selectedTimeFilter: event.filter));
}

void myActivityTypeFilterChanged(
  MyActivityBloc bloc,
  TypeFilterChanged event,
  Emitter<MyActivityState> emit,
) {
  final cur = bloc.state;
  if (cur is! MyActivityLoaded) return;
  _emitFiltered(bloc, emit, cur.copyWith(selectedTypeFilter: event.type));
}

void myActivityLeadFilterChanged(
  MyActivityBloc bloc,
  LeadFilterChanged event,
  Emitter<MyActivityState> emit,
) {
  final cur = bloc.state;
  if (cur is! MyActivityLoaded) return;
  _emitFiltered(bloc, emit, cur.copyWith(selectedLead: event.leadName));
}

void _emitFiltered(
  MyActivityBloc bloc,
  Emitter<MyActivityState> emit,
  MyActivityLoaded current,
) {
  final items = bloc.repository.getAllActivities();
  final filtered = applyActivityFilters(
    items,
    timeFilter: current.selectedTimeFilter,
    typeFilter: current.selectedTypeFilter,
    leadFilter: current.selectedLead,
  );
  final grouped = groupByDate(filtered);
  emit(
    current.copyWith(
      groupedActivities: grouped,
      totalCount: _countItems(grouped),
    ),
  );
}

int _countItems(List<ActivityDateGroup> groups) =>
    groups.fold(0, (sum, g) => sum + g.items.length);
