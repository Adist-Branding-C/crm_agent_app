import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_bloc.dart';
import 'search_event.dart';
import 'search_state.dart';
import 'search_session_data.dart';
import 'search_helpers.dart';

/// Extension defining event handlers for [SearchBloc].
extension SearchHandlers on SearchBloc {
  /// Loads all static database session parameters to enable local offline search.
  Future<void> loadAllData(Emitter<SearchState> emit) async {
    emit(const SearchLoading());
    try {
      final session = await loadSearchSession(
        leadsRepo: leadsRepo,
        tasksRepo: tasksRepo,
        spotlightRepo: spotlightRepo,
        followUpsRepo: followUpsRepo,
      );
      emit(SearchInitial(
        session: session.copyWith(
          recentQueries: List.unmodifiable(recentQueries),
        ),
      ));
    } catch (e) {
      emit(const SearchError(SearchFailure.load));
    }
  }

  /// Triggers a search query filter across tasks, leads, follow-ups, and spotlights.
  Future<void> onQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    final q = event.query.trim();
    if (q.isEmpty) return loadAllData(emit);
    recentQueries..remove(q)..insert(0, q);
    if (recentQueries.length > 3) recentQueries.removeLast();
    final cur = state;
    SearchSessionData session;
    if (cur is! SearchInitial || cur.session.leads.isEmpty) {
      emit(const SearchLoading());
      session = await loadSearchSession(
        leadsRepo: leadsRepo,
        tasksRepo: tasksRepo,
        spotlightRepo: spotlightRepo,
        followUpsRepo: followUpsRepo,
      );
    } else {
      session = cur.session;
    }
    emit(const SearchLoading());
    try {
      final results = searchEntities(session, q.toLowerCase());
      emit(
        SearchLoaded(
          query: event.query,
          results: results,
          groupedResults: groupResults(results),
        ),
      );
    } catch (e) {
      emit(const SearchError(SearchFailure.query));
    }
  }
}
