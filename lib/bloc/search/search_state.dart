import 'package:equatable/equatable.dart';
import '../leads/leads_models.dart';
import '../tasks/tasks_models.dart';
import '../follow_ups/follow_ups_models.dart';
import 'search_result.dart';

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
  final Map<String, List<SearchResult>> groupedResults;

  const SearchLoaded({
    required this.query,
    required this.results,
    required this.groupedResults,
  });

  @override
  List<Object?> get props => [query, results, groupedResults];
}

enum SearchFailure { load, query, unknown }

/// State representing a failed search.
class SearchError extends SearchState {
  final SearchFailure failure;

  const SearchError(this.failure);

  @override
  List<Object?> get props => [failure];
}
