part of 'leads_bloc.dart';

/// Base class for all states emitted by the [LeadsBloc].
abstract class LeadsState extends Equatable {
  const LeadsState();

  @override
  List<Object?> get props => [];
}

/// Initial state of the Leads page.
class LeadsInitial extends LeadsState {
  const LeadsInitial();
}

/// State representing active data retrieval.
class LeadsLoading extends LeadsState {
  const LeadsLoading();
}

/// State emitted once the leads dataset is loaded and filtered.
class LeadsLoaded extends LeadsState {
  /// Complete dataset of mock leads.
  final List<Lead> allLeads;

  /// Leads matching the current search, category, and spotlight filters.
  final List<Lead> filteredLeads;

  /// Current text search filter.
  final String searchQuery;

  /// Current category filter selected (null represents 'All').
  final LeadCategory? selectedCategory;

  /// Whether spotlight (only Hot leads) is enabled.
  final bool isSpotlightOnly;

  /// Sorting order selected.
  final SortLeadsBy sortBy;

  /// Selected status filter.
  final LeadStatus? selectedStatus;

  /// Selected source filter.
  final LeadSource? selectedSource;

  /// Creates a constant [LeadsLoaded].
  const LeadsLoaded({
    required this.allLeads,
    required this.filteredLeads,
    required this.searchQuery,
    required this.selectedCategory,
    required this.isSpotlightOnly,
    required this.sortBy,
    this.selectedStatus,
    this.selectedSource,
  });

  @override
  List<Object?> get props => [
        allLeads,
        filteredLeads,
        searchQuery,
        selectedCategory,
        isSpotlightOnly,
        sortBy,
        selectedStatus,
        selectedSource,
      ];
}

/// State emitted on error occurrence.
class LeadsError extends LeadsState {
  final String message;

  /// Creates a constant [LeadsError].
  const LeadsError(this.message);

  @override
  List<Object?> get props => [message];
}
