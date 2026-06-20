import 'package:equatable/equatable.dart';
import 'leads_enums.dart';
import 'leads_models.dart';

abstract class LeadsEvent extends Equatable {
  const LeadsEvent();
  @override
  List<Object?> get props => [];
}

class FetchLeads extends LeadsEvent {
  const FetchLeads();
}

class SearchLeadsChanged extends LeadsEvent {
  final String query;
  const SearchLeadsChanged(this.query);
  @override
  List<Object?> get props => [query];
}

class FilterCategoryChanged extends LeadsEvent {
  final LeadCategory? category;
  const FilterCategoryChanged(this.category);
  @override
  List<Object?> get props => [category];
}

class ToggleSpotlight extends LeadsEvent {
  const ToggleSpotlight();
}

class AddLead extends LeadsEvent {
  final Lead lead;
  const AddLead(this.lead);
  @override
  List<Object?> get props => [lead];
}

class ApplyFilterOptions extends LeadsEvent {
  final SortLeadsBy sortBy;
  final LeadStatus? status;
  final LeadSource? source;
  const ApplyFilterOptions({required this.sortBy, this.status, this.source});
  @override
  List<Object?> get props => [sortBy, status, source];
}

class LeadDeleted extends LeadsEvent {
  final String leadId;
  const LeadDeleted(this.leadId);
  @override
  List<Object?> get props => [leadId];
}

class LeadUpdated extends LeadsEvent {
  final Lead lead;
  const LeadUpdated(this.lead);
  @override
  List<Object?> get props => [lead];
}
