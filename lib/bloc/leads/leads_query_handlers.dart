import 'package:flutter_bloc/flutter_bloc.dart';
import 'leads_bloc.dart';
import 'leads_enums.dart';

/// Extension defining query and search handlers for [LeadsBloc].
extension LeadsQueryHandlers on LeadsBloc {
  /// Fetches all leads from the repository.
  Future<void> onFetchLeads(FetchLeads event, Emitter<LeadsState> emit) async {
    emit(const LeadsLoading());
    try {
      final all = await leadsRepository.getLeads();
      emitFiltered(emit, all, '', null, false, SortLeadsBy.newest, null, null);
    } catch (e) {
      emit(LeadsError(e.toString()));
    }
  }

  /// Triggered when the search query text field changes.
  void onSearchLeadsChanged(SearchLeadsChanged ev, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      emitFiltered(
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

  /// Triggered when the category filter chip changes.
  void onFilterCategoryChanged(
    FilterCategoryChanged ev,
    Emitter<LeadsState> emit,
  ) {
    final s = state;
    if (s is LeadsLoaded) {
      emitFiltered(
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

  /// Toggles the spotlight-only filter view.
  void onToggleSpotlight(ToggleSpotlight event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      emitFiltered(
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

  /// Applies advanced status, source, and sort filters.
  void onApplyFilterOptions(ApplyFilterOptions ev, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      emitFiltered(
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
}
