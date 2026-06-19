import 'package:equatable/equatable.dart';
import 'leads_enums.dart';
import 'leads_models.dart';

/// Base class for all events handled by the [LeadsBloc].
abstract class LeadsEvent extends Equatable {
  const LeadsEvent();

  @override
  List<Object?> get props => [];
}

/// Event dispatched to trigger the initial load of leads.
class FetchLeads extends LeadsEvent {
  const FetchLeads();
}

/// Event dispatched when the search query text input changes.
class SearchLeadsChanged extends LeadsEvent {
  final String query;

  /// Creates a constant [SearchLeadsChanged].
  const SearchLeadsChanged(this.query);

  @override
  List<Object?> get props => [query];
}

/// Event dispatched when a filter category tab (All, Hot, etc.) is clicked.
class FilterCategoryChanged extends LeadsEvent {
  final LeadCategory? category;

  /// Creates a constant [FilterCategoryChanged].
  const FilterCategoryChanged(this.category);

  @override
  List<Object?> get props => [category];
}

/// Event dispatched to toggle the spotlight (fire icon) filter mode.
class ToggleSpotlight extends LeadsEvent {
  const ToggleSpotlight();
}

/// Event dispatched when a new lead is successfully created and needs to be added to the list.
class AddLead extends LeadsEvent {
  final Lead lead;

  /// Creates a constant [AddLead] event.
  const AddLead(this.lead);

  @override
  List<Object?> get props => [lead];
}

/// Event dispatched to apply advanced sort and filter options.
class ApplyFilterOptions extends LeadsEvent {
  final SortLeadsBy sortBy;
  final LeadStatus? status;
  final LeadSource? source;

  /// Creates a constant [ApplyFilterOptions].
  const ApplyFilterOptions({
    required this.sortBy,
    this.status,
    this.source,
  });

  @override
  List<Object?> get props => [sortBy, status, source];
}

/// Event dispatched when a lead is deleted.
class LeadDeleted extends LeadsEvent {
  final String leadId;
  const LeadDeleted(this.leadId);

  @override
  List<Object?> get props => [leadId];
}
