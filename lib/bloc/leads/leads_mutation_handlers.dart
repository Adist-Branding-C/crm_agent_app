import 'package:flutter_bloc/flutter_bloc.dart';
import 'leads_bloc.dart';

/// Extension defining mutation and update handlers for [LeadsBloc].
extension LeadsMutationHandlers on LeadsBloc {
  /// Adds a new lead to the repository.
  Future<void> onAddLead(AddLead event, Emitter<LeadsState> emit) async {
    final s = state;
    if (s is LeadsLoaded) {
      await leadsRepository.addLead(event.lead);
      final all = await leadsRepository.getLeads();
      emitFiltered(
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

  /// Triggered when a lead is deleted.
  void onLeadDeleted(LeadDeleted event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      final all = s.allLeads.where((l) => l.id != event.leadId).toList();
      emitFiltered(
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

  /// Triggered when a lead is updated.
  void onLeadUpdated(LeadUpdated event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      final all = s.allLeads
          .map((l) => l.id == event.lead.id ? event.lead : l)
          .toList();
      emitFiltered(
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
}
