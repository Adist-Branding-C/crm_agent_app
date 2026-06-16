part of 'leads_bloc.dart';

/// Extension containing all event handlers for [LeadsBloc].
extension LeadsHandlers on LeadsBloc {
  Future<void> _onFetchLeads(FetchLeads event, Emitter<LeadsState> emit) async {
    emit(const LeadsLoading());
    try {
      final leads = await leadsRepository.getLeads();
      _emitFilteredState(emit, leads, '', null, false, SortLeadsBy.newest, null, null);
    } catch (e) {
      emit(LeadsError(e.toString()));
    }
  }

  void _onSearchLeadsChanged(SearchLeadsChanged ev, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      _emitFilteredState(emit, s.allLeads, ev.query, s.selectedCategory, s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  void _onFilterCategoryChanged(FilterCategoryChanged ev, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      _emitFilteredState(emit, s.allLeads, s.searchQuery, ev.category, s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  void _onToggleSpotlight(ToggleSpotlight event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      _emitFilteredState(emit, s.allLeads, s.searchQuery, s.selectedCategory, !s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  Future<void> _onAddLead(AddLead event, Emitter<LeadsState> emit) async {
    final s = state;
    if (s is LeadsLoaded) {
      await leadsRepository.addLead(event.lead);
      final leads = await leadsRepository.getLeads();
      _emitFilteredState(emit, leads, s.searchQuery, s.selectedCategory, s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  void _onApplyFilterOptions(ApplyFilterOptions ev, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      _emitFilteredState(emit, s.allLeads, s.searchQuery, s.selectedCategory, s.isSpotlightOnly, ev.sortBy, ev.status, ev.source);
    }
  }

  void _onLeadDeleted(LeadDeleted event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      final updated = s.allLeads.where((l) => l.id != event.leadId).toList();
      _emitFilteredState(emit, updated, s.searchQuery, s.selectedCategory, s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  void _emitFilteredState(Emitter<LeadsState> emit, List<Lead> all, String q, LeadCategory? c, bool s, SortLeadsBy sort, LeadStatus? status, LeadSource? src) {
    final filtered = applyLeadsFilteringAndSorting(all, query: q, category: c, spotlight: s, sortBy: sort, status: status, source: src);
    emit(LeadsLoaded(allLeads: all, filteredLeads: filtered, searchQuery: q, selectedCategory: c, isSpotlightOnly: s, sortBy: sort, selectedStatus: status, selectedSource: src));
  }
}
