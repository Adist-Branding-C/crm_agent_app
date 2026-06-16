import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/leads_repository.dart';
import 'leads_enums.dart';
import 'leads_filter_helper.dart';
import 'leads_models.dart';

part 'leads_event.dart';
part 'leads_state.dart';
part 'leads_state_loaded.dart';

/// Business logic component managing lead lists, searching, and filtering.
class LeadsBloc extends Bloc<LeadsEvent, LeadsState> {
  /// The leads repository.
  final LeadsRepository leadsRepository;

  /// Initializes the BLoC with [LeadsInitial].
  LeadsBloc({required this.leadsRepository}) : super(const LeadsInitial()) {
    on<FetchLeads>(_onFetchLeads);
    on<SearchLeadsChanged>(_onSearchLeadsChanged);
    on<FilterCategoryChanged>(_onFilterCategoryChanged);
    on<ToggleSpotlight>(_onToggleSpotlight);
    on<AddLead>(_onAddLead);
    on<ApplyFilterOptions>(_onApplyFilterOptions);
  }

  Future<void> _onFetchLeads(FetchLeads event, Emitter<LeadsState> emit) async {
    emit(const LeadsLoading());
    try {
      final leads = await leadsRepository.getLeads();
      _emitFilteredState(emit, leads, '', null, false, SortLeadsBy.newest, null, null);
    } catch (e) {
      emit(LeadsError(e.toString()));
    }
  }

  void _onSearchLeadsChanged(SearchLeadsChanged event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      _emitFilteredState(emit, s.allLeads, event.query, s.selectedCategory, s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
    }
  }

  void _onFilterCategoryChanged(FilterCategoryChanged event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      _emitFilteredState(emit, s.allLeads, s.searchQuery, event.category, s.isSpotlightOnly, s.sortBy, s.selectedStatus, s.selectedSource);
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

  void _onApplyFilterOptions(ApplyFilterOptions event, Emitter<LeadsState> emit) {
    final s = state;
    if (s is LeadsLoaded) {
      _emitFilteredState(emit, s.allLeads, s.searchQuery, s.selectedCategory, s.isSpotlightOnly, event.sortBy, event.status, event.source);
    }
  }

  void _emitFilteredState(Emitter<LeadsState> emit, List<Lead> all, String q, LeadCategory? c, bool s, SortLeadsBy sort, LeadStatus? status, LeadSource? src) {
    final filtered = applyLeadsFilteringAndSorting(all, query: q, category: c, spotlight: s, sortBy: sort, status: status, source: src);
    emit(LeadsLoaded(allLeads: all, filteredLeads: filtered, searchQuery: q, selectedCategory: c, isSpotlightOnly: s, sortBy: sort, selectedStatus: status, selectedSource: src));
  }
}
