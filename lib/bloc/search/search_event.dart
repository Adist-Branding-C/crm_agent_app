part of 'search_bloc.dart';

/// Base class for all events handled by the [SearchBloc].
abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

/// Event dispatched when the search query text input changes.
class SearchQueryChanged extends SearchEvent {
  final String query;

  /// Creates a constant [SearchQueryChanged].
  const SearchQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

/// Event dispatched to clear search results and reset query.
class ClearSearch extends SearchEvent {
  const ClearSearch();
}
