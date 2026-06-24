import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/leads_repository.dart';
import 'leads_event.dart';
import 'leads_models.dart';
import 'leads_state.dart';
import 'leads_enums.dart';
import 'leads_filter_helper.dart';
import 'leads_query_handlers.dart';
import 'leads_mutation_handlers.dart';
import 'leads_state_loaded.dart';

export 'leads_event.dart';
export 'leads_state.dart';
export 'leads_state_loaded.dart';

class LeadsBloc extends Bloc<LeadsEvent, LeadsState> {
  final LeadsRepository leadsRepository;
  late final StreamSubscription<String> _deletedSub;
  late final StreamSubscription<Lead> _updatedSub;

  LeadsBloc({required this.leadsRepository}) : super(const LeadsInitial()) {
    on<FetchLeads>(onFetchLeads);
    on<SearchLeadsChanged>(onSearchLeadsChanged);
    on<FilterCategoryChanged>(onFilterCategoryChanged);
    on<ToggleSpotlight>(onToggleSpotlight);
    on<AddLead>(onAddLead);
    on<ApplyFilterOptions>(onApplyFilterOptions);
    on<LeadDeleted>(onLeadDeleted);
    on<LeadUpdated>(onLeadUpdated);

    _deletedSub = leadsRepository.leadDeletedStream.listen(
      (id) => add(LeadDeleted(id)),
    );
    _updatedSub = leadsRepository.leadUpdatedStream.listen(
      (lead) => add(LeadUpdated(lead)),
    );
  }

  /// Shared helper to filter and emit LeadsLoaded state.
  void emitFiltered(
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

  @override
  Future<void> close() {
    _deletedSub.cancel();
    _updatedSub.cancel();
    return super.close();
  }
}
