import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/leads_repository.dart';
import '../../data/repositories/tasks_repository.dart';
import '../../data/repositories/spotlight_repository.dart';
import '../../data/repositories/follow_ups_repository.dart';
import '../leads/leads_models.dart';
import '../tasks/tasks_models.dart';
import '../follow_ups/follow_ups_models.dart';
import 'search_result.dart';
import 'search_cache.dart';
part 'search_event.dart';
part 'search_state.dart';
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchCache _cache;
  SearchBloc({
    required LeadsRepository leadsRepo,
    required TasksRepository tasksRepo,
    required SpotlightRepository spotlightRepo,
    required FollowUpsRepository followUpsRepo,
  }) : _cache = SearchCache(
      leadsRepo: leadsRepo, tasksRepo: tasksRepo,
      spotlightRepo: spotlightRepo, followUpsRepo: followUpsRepo,
    ), super(const SearchInitial()) {
    on<InitializeSearch>((e, emit) => _loadAllData(emit));
    on<SearchQueryChanged>(_onChange);
    on<ClearSearch>((e, emit) => _loadAllData(emit));
  }
  Future<void> _loadAllData(Emitter<SearchState> emit) async {
    emit(const SearchLoading());
    try {
      await _cache.ensureLoaded();
      emit(SearchInitial(
        recentQueries: _cache.recents,
        suggestedLeads: _cache.leads.take(2).toList(),
        suggestedTasks: _cache.tasks.take(2).toList(),
        suggestedFollowUps: _cache.followUps.take(2).toList(),
      ));
    } catch (e) {
      emit(const SearchError(SearchFailure.load));
    }
  }
  Future<void> _onChange(SearchQueryChanged event, Emitter<SearchState> emit) async {
    final q = event.query.trim();
    if (q.isEmpty) return _loadAllData(emit);
    await _cache.ensureLoaded();
    emit(const SearchLoading());
    try {
      final queryLower = q.toLowerCase();
      final ml = _cache.leads.where((l) =>
          l.name.toLowerCase().contains(queryLower) || l.phone.contains(queryLower) ||
          l.location.toLowerCase().contains(queryLower)).map(LeadSearchResult.new);
      final mt = _cache.tasks.where((t) =>
          t.title.toLowerCase().contains(queryLower) ||
          (t.description?.toLowerCase().contains(queryLower) ?? false)).map(TaskSearchResult.new);
      final ms = _cache.spotlights.where((s) =>
          s.title.toLowerCase().contains(queryLower) ||
          s.description.toLowerCase().contains(queryLower)).map(SpotlightSearchResult.new);
      final mf = _cache.followUps
          .where((f) => f.name.toLowerCase().contains(queryLower)).map(FollowUpSearchResult.new);
      _cache.addRecent(q);
      emit(SearchLoaded(query: event.query, results: [
        ...ml, ...mt, ...ms, ...mf,
      ]));
    } catch (e) {
      emit(const SearchError(SearchFailure.query));
    }
  }
}
