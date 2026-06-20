import 'package:flutter_bloc/flutter_bloc.dart';
import 'leads_bloc.dart';
import 'leads_enums.dart';
import 'leads_filter_helper.dart';

extension LeadsHandlers on LeadsBloc {
  Future<void> onFetchLeads(FetchLeads event, Emitter<LeadsState> emit) async {
    emit(const LeadsLoading());
    try {
      updateAllLeads(await leadsRepository.getLeads());
      emitFilteredState(emit, '', null, false, SortLeadsBy.newest, null, null);
    } catch (e) {
      emit(LeadsError(e.toString()));
    }
  }

  void onSearchLeadsChanged(SearchLeadsChanged ev, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      emitFilteredState(emit, ev.query, s.selectedCategory, s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  void onFilterCategoryChanged(FilterCategoryChanged ev, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      emitFilteredState(emit, s.searchQuery, ev.category, s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  void onToggleSpotlight(ToggleSpotlight event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      emitFilteredState(emit, s.searchQuery, s.selectedCategory, !s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  Future<void> onAddLead(AddLead event, Emitter<LeadsState> emit) async {
    final s = state;
    if (s is LeadsLoaded) {
      await leadsRepository.addLead(event.lead);
      updateAllLeads(await leadsRepository.getLeads());
      emitFilteredState(emit, s.searchQuery, s.selectedCategory, s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  void onApplyFilterOptions(ApplyFilterOptions ev, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      emitFilteredState(emit, s.searchQuery, s.selectedCategory, s.isSpotlightOnly, ev.sortBy, ev.status, ev.source);
    }
  }

  void onLeadDeleted(LeadDeleted event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      updateAllLeads(allLeads.where((l) => l.id != event.leadId).toList());
      emitFilteredState(emit, s.searchQuery, s.selectedCategory, s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  void onLeadUpdated(LeadUpdated event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      final updatedList = allLeads.map((l) => l.id == event.lead.id ? event.lead : l).toList();
      updateAllLeads(updatedList);
      emitFilteredState(emit, s.searchQuery, s.selectedCategory, s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  void emitFilteredState(Emitter<LeadsState> emit, String q, LeadCategory? c, bool s, SortLeadsBy sort, LeadStatus? status, LeadSource? src) {
    final filtered = applyLeadsFilteringAndSorting(allLeads, query: q, category: c, spotlight: s, sortBy: sort, status: status, source: src);
    emit(LeadsLoaded(filteredLeads: filtered, searchQuery: q, selectedCategory: c, isSpotlightOnly: s, sortBy: sort, selectedStatus: status, selectedSource: src));
  }
}
