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

  /// Creates a constant [SearchInitial] state with default recent queries.
  const SearchInitial({
    this.recentQueries = const [
      'Rahul Menon',
      'Hot leads',
      'Follow-ups today',
    ],
  });

  @override
  List<Object?> get props => [recentQueries];
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

/// State representing a failed search.
class SearchError extends SearchState {
  final String message;

  /// Creates a constant [SearchError] state.
  const SearchError(this.message);

  @override
  List<Object?> get props => [message];
}
