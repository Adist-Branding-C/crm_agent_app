import 'package:flutter_bloc/flutter_bloc.dart';
import 'leads_bloc.dart';
import 'leads_enums.dart';
import 'leads_filter_helper.dart';
import 'leads_models.dart';

extension LeadsHandlers on LeadsBloc {
  Future<void> onFetchLeads(FetchLeads event, Emitter<LeadsState> emit) async {
    emit(const LeadsLoading());
    try {
      final all = await leadsRepository.getLeads();
      _emitFiltered(emit, all, '', null, false, SortLeadsBy.newest, null, null);
    } catch (e) {
      emit(LeadsError(e.toString()));
    }
  }

  void onSearchLeadsChanged(SearchLeadsChanged ev, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      _emitFiltered(
        emit,
        s.allLeads,
        ev.query,
        s.selectedCategory,
        s.isSpotlightOnly,
        s.sortBy,
        s.selectedStatus,
        s.selectedSource,
      );
    }
  }

  void onFilterCategoryChanged(
    FilterCategoryChanged ev,
    Emitter<LeadsState> emit,
  ) {
    final s = state;
    if (s is LeadsLoaded) {
      _emitFiltered(
        emit,
        s.allLeads,
        s.searchQuery,
        ev.category,
        s.isSpotlightOnly,
        s.sortBy,
        s.selectedStatus,
        s.selectedSource,
      );
    }
  }

  void onToggleSpotlight(ToggleSpotlight event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      _emitFiltered(
        emit,
        s.allLeads,
        s.searchQuery,
        s.selectedCategory,
        !s.isSpotlightOnly,
        s.sortBy,
        s.selectedStatus,
        s.selectedSource,
      );
    }
  }

  Future<void> onAddLead(AddLead event, Emitter<LeadsState> emit) async {
    final s = state;
    if (s is LeadsLoaded) {
      await leadsRepository.addLead(event.lead);
      final all = await leadsRepository.getLeads();
      _emitFiltered(
        emit,
        all,
        s.searchQuery,
        s.selectedCategory,
        s.isSpotlightOnly,
        s.sortBy,
        s.selectedStatus,
        s.selectedSource,
      );
    }
  }

  void onApplyFilterOptions(ApplyFilterOptions ev, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      _emitFiltered(
        emit,
        s.allLeads,
        s.searchQuery,
        s.selectedCategory,
        s.isSpotlightOnly,
        ev.sortBy,
        ev.status,
        ev.source,
      );
    }
  }

  void onLeadDeleted(LeadDeleted event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      final all = s.allLeads.where((l) => l.id != event.leadId).toList();
      _emitFiltered(
        emit,
        all,
        s.searchQuery,
        s.selectedCategory,
        s.isSpotlightOnly,
        s.sortBy,
        s.selectedStatus,
        s.selectedSource,
      );
    }
  }

  void onLeadUpdated(LeadUpdated event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      final all = s.allLeads
          .map((l) => l.id == event.lead.id ? event.lead : l)
          .toList();
      _emitFiltered(
        emit,
        all,
        s.searchQuery,
        s.selectedCategory,
        s.isSpotlightOnly,
        s.sortBy,
        s.selectedStatus,
        s.selectedSource,
      );
    }
  }

  void _emitFiltered(
    Emitter<LeadsState> emit,
    List<Lead> all,
    String q,
    LeadCategory? c,
    bool sp,
    SortLeadsBy sort,
    LeadStatus? status,
    LeadSource? src,
  ) {
    final filtered = applyLeadsFilteringAndSorting(
      all,
      query: q,
      category: c,
      spotlight: sp,
      sortBy: sort,
      status: status,
      source: src,
    );
    emit(
      LeadsLoaded(
        allLeads: all,
        filteredLeads: filtered,
        searchQuery: q,
        selectedCategory: c,
        isSpotlightOnly: sp,
        sortBy: sort,
        selectedStatus: status,
        selectedSource: src,
      ),
    );
  }
}
