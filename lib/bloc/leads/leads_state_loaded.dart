import 'leads_enums.dart';
import 'leads_models.dart';
import 'leads_state.dart';

class LeadsLoaded extends LeadsState {
  final List<Lead> filteredLeads;
  final String searchQuery;
  final LeadCategory? selectedCategory;
  final bool isSpotlightOnly;
  final SortLeadsBy sortBy;
  final LeadStatus? selectedStatus;
  final LeadSource? selectedSource;

  const LeadsLoaded({
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
    filteredLeads, searchQuery, selectedCategory,
    isSpotlightOnly, sortBy, selectedStatus, selectedSource,
  ];
}
