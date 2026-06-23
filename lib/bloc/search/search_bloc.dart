// ignore_for_file: prefer_initializing_formals

export 'search_event.dart';
export 'search_state.dart';
export 'search_result.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_result.dart';
import 'search_cache.dart';
import 'search_event.dart';
import 'search_state.dart';

Map<String, List<SearchResult>> _groupResults(List<SearchResult> results) {
  final Map<String, List<SearchResult>> groups = {};
  for (final result in results) {
    groups.putIfAbsent(result.categoryName, () => []).add(result);
  }
  return groups;
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchCache _cache;

  SearchBloc({
    required SearchCache cache,
  }) : _cache = cache, super(const SearchInitial()) {
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
      final results = [...ml, ...mt, ...ms, ...mf];
      emit(SearchLoaded(query: event.query, results: results, groupedResults: _groupResults(results)));
    } catch (e) {
      emit(const SearchError(SearchFailure.query));
    }
  }
}
