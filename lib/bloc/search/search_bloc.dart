export 'search_event.dart';
export 'search_state.dart';
export 'search_result.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/leads_repository.dart';
import '../../data/repositories/tasks_repository.dart';
import '../../data/repositories/spotlight_repository.dart';
import '../../data/repositories/follow_ups_repository.dart';
import 'search_event.dart';
import 'search_state.dart';
import 'search_session_data.dart';
import 'search_helpers.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final LeadsRepository leadsRepo;
  final TasksRepository tasksRepo;
  final SpotlightRepository spotlightRepo;
  final FollowUpsRepository followUpsRepo;

  SearchBloc({
    required this.leadsRepo,
    required this.tasksRepo,
    required this.spotlightRepo,
    required this.followUpsRepo,
  }) : super(const SearchInitial()) {
    on<InitializeSearch>((e, emit) => _loadAllData(emit));
    on<SearchQueryChanged>(_onChange);
    on<ClearSearch>((e, emit) => _loadAllData(emit));
  }

  Future<void> _loadAllData(Emitter<SearchState> emit) async {
    emit(const SearchLoading());
    try {
      final session = await loadSearchSession(
        leadsRepo: leadsRepo, tasksRepo: tasksRepo,
        spotlightRepo: spotlightRepo, followUpsRepo: followUpsRepo,
      );
      emit(SearchInitial(session: session));
    } catch (e) {
      emit(const SearchError(SearchFailure.load));
    }
  }

  Future<void> _onChange(SearchQueryChanged event, Emitter<SearchState> emit) async {
    final q = event.query.trim();
    if (q.isEmpty) return _loadAllData(emit);
    final cur = state;
    SearchSessionData session;
    if (cur is! SearchInitial || cur.session.leads.isEmpty) {
      emit(const SearchLoading());
      session = await loadSearchSession(
        leadsRepo: leadsRepo, tasksRepo: tasksRepo,
        spotlightRepo: spotlightRepo, followUpsRepo: followUpsRepo,
      );
    } else {
      session = cur.session;
    }
    emit(const SearchLoading());
    try {
      final results = searchEntities(session, q.toLowerCase());
      emit(SearchLoaded(
        query: event.query,
        results: results,
        groupedResults: groupResults(results),
      ));
    } catch (e) {
      emit(const SearchError(SearchFailure.query));
    }
  }
}
