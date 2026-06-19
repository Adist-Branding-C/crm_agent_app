import 'package:flutter_bloc/flutter_bloc.dart';
import 'leads_bloc.dart';
import 'leads_enums.dart';
import 'leads_models.dart';
import 'leads_filter_helper.dart';

/// Extension containing all event handlers for [LeadsBloc].
extension LeadsHandlers on LeadsBloc {
  Future<void> onFetchLeads(FetchLeads event, Emitter<LeadsState> emit) async {
    emit(const LeadsLoading());
    try {
      final leads = await leadsRepository.getLeads();
      emitFilteredState(emit, leads, '', null, false, SortLeadsBy.newest, null, null);
    } catch (e) {
      emit(LeadsError(e.toString()));
    }
  }

  void onSearchLeadsChanged(SearchLeadsChanged ev, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      emitFilteredState(emit, s.allLeads, ev.query, s.selectedCategory, s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  void onFilterCategoryChanged(FilterCategoryChanged ev, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      emitFilteredState(emit, s.allLeads, s.searchQuery, ev.category, s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  void onToggleSpotlight(ToggleSpotlight event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      emitFilteredState(emit, s.allLeads, s.searchQuery, s.selectedCategory, !s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  Future<void> onAddLead(AddLead event, Emitter<LeadsState> emit) async {
    final s = state;
    if (s is LeadsLoaded) {
      await leadsRepository.addLead(event.lead);
      final leads = await leadsRepository.getLeads();
      emitFilteredState(emit, leads, s.searchQuery, s.selectedCategory, s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  void onApplyFilterOptions(ApplyFilterOptions ev, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      emitFilteredState(emit, s.allLeads, s.searchQuery, s.selectedCategory, s.isSpotlightOnly, ev.sortBy, ev.status, ev.source);
    }
  }

  void onLeadDeleted(LeadDeleted event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      final updated = s.allLeads.where((l) => l.id != event.leadId).toList();
      emitFilteredState(emit, updated, s.searchQuery, s.selectedCategory, s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  void emitFilteredState(Emitter<LeadsState> emit, List<Lead> all, String q, LeadCategory? c, bool s, SortLeadsBy sort, LeadStatus? status, LeadSource? src) {
    final filtered = applyLeadsFilteringAndSorting(all, query: q, category: c, spotlight: s, sortBy: sort, status: status, source: src);
    emit(LeadsLoaded(allLeads: all, filteredLeads: filtered, searchQuery: q, selectedCategory: c, isSpotlightOnly: s, sortBy: sort, selectedStatus: status, selectedSource: src));
  }
}
