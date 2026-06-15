import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'leads_models.dart';
import 'mock_leads.dart';

part 'leads_event.dart';
part 'leads_state.dart';

/// Business logic component managing lead lists, searching, and filtering.
class LeadsBloc extends Bloc<LeadsEvent, LeadsState> {
  /// Initializes the BLoC with [LeadsInitial].
  LeadsBloc() : super(const LeadsInitial()) {
    on<FetchLeads>(_onFetchLeads);
    on<SearchLeadsChanged>(_onSearchLeadsChanged);
    on<FilterCategoryChanged>(_onFilterCategoryChanged);
    on<ToggleSpotlight>(_onToggleSpotlight);
    on<AddLead>(_onAddLead);
  }

  Future<void> _onFetchLeads(FetchLeads event, Emitter<LeadsState> emit) async {
    emit(const LeadsLoading());
    await Future.delayed(const Duration(milliseconds: 300));
    _applyFilters(emit, mockLeads, '', 'All', false);
  }

  void _onSearchLeadsChanged(
    SearchLeadsChanged event,
    Emitter<LeadsState> emit,
  ) {
    final s = state;
    if (s is LeadsLoaded)
      _applyFilters(
        emit,
        s.allLeads,
        event.query,
        s.selectedCategory,
        s.isSpotlightOnly,
      );
  }

  void _onFilterCategoryChanged(
    FilterCategoryChanged event,
    Emitter<LeadsState> emit,
  ) {
    final s = state;
    if (s is LeadsLoaded)
      _applyFilters(
        emit,
        s.allLeads,
        s.searchQuery,
        event.category,
        s.isSpotlightOnly,
      );
  }

  void _onToggleSpotlight(ToggleSpotlight event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded)
      _applyFilters(
        emit,
        s.allLeads,
        s.searchQuery,
        s.selectedCategory,
        !s.isSpotlightOnly,
      );
  }

  void _onAddLead(AddLead event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded)
      _applyFilters(
        emit,
        [event.lead, ...s.allLeads],
        s.searchQuery,
        s.selectedCategory,
        s.isSpotlightOnly,
      );
  }

  void _applyFilters(
    Emitter<LeadsState> emit,
    List<Lead> all,
    String query,
    String category,
    bool spotlight,
  ) {
    var filtered = all;
    if (spotlight) {
      filtered = filtered.where((l) => l.category == 'Hot').toList();
    }
    if (category != 'All') {
      filtered = filtered.where((l) => l.category == category).toList();
    }
    if (query.isNotEmpty) {
      final q = query.toLowerCase();
      filtered = filtered
          .where(
            (l) =>
                l.name.toLowerCase().contains(q) ||
                l.phone.contains(q) ||
                l.location.toLowerCase().contains(q),
          )
          .toList();
    }
    emit(
      LeadsLoaded(
        allLeads: all,
        filteredLeads: filtered,
        searchQuery: query,
        selectedCategory: category,
        isSpotlightOnly: spotlight,
      ),
    );
  }
}
