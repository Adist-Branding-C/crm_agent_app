import 'leads_enums.dart';
import 'leads_models.dart';
import 'leads_state.dart';

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
