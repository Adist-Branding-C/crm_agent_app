part of 'search_bloc.dart';

/// Base class for all states emitted by the [SearchBloc].
abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

/// State representing search page with no search query typed yet.
class SearchInitial extends SearchState {
  final List<String> recentQueries;
  final List<Lead> suggestedLeads;
  final List<Task> suggestedTasks;
  final List<FollowUp> suggestedFollowUps;

  /// Creates a constant [SearchInitial] state.
  const SearchInitial({
    this.recentQueries = const [],
    this.suggestedLeads = const [],
    this.suggestedTasks = const [],
    this.suggestedFollowUps = const [],
  });

  @override
  List<Object?> get props => [
        recentQueries,
        suggestedLeads,
        suggestedTasks,
        suggestedFollowUps,
      ];
}

/// State representing active search execution.
class SearchLoading extends SearchState {
  const SearchLoading();
}

/// State representing completed search with matching results.
class SearchLoaded extends SearchState {
  final String query;
  final List<SearchResult> results;

  /// Creates a constant [SearchLoaded] state.
  const SearchLoaded({required this.query, required this.results});

  /// Groups the results by category name.
  Map<String, List<SearchResult>> get groupedResults {
    final Map<String, List<SearchResult>> groups = {};
    for (final result in results) {
      groups.putIfAbsent(result.categoryName, () => []).add(result);
    }
    return groups;
  }

  @override
  List<Object?> get props => [query, results];
}

enum SearchFailure { load, query, unknown }

/// State representing a failed search.
class SearchError extends SearchState {
  final SearchFailure failure;

  const SearchError(this.failure);

  String get message {
    switch (failure) {
      case SearchFailure.load: return 'Failed to load search data';
      case SearchFailure.query: return 'Search failed';
      case SearchFailure.unknown: return 'An error occurred';
    }
  }

  @override
  List<Object?> get props => [failure];
}
