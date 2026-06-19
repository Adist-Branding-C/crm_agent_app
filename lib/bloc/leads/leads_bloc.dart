import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/leads_repository.dart';
import 'leads_event.dart';
import 'leads_models.dart';
import 'leads_state.dart';
import 'leads_handlers.dart';

export 'leads_event.dart';
export 'leads_state.dart';
export 'leads_state_loaded.dart';

class LeadsBloc extends Bloc<LeadsEvent, LeadsState> {
  final LeadsRepository leadsRepository;
  List<Lead>? _allLeads;
  late final StreamSubscription<String> _deletedSub;

  List<Lead> get allLeads => _allLeads ?? [];

  void updateAllLeads(List<Lead> leads) => _allLeads = leads;

  LeadsBloc({required this.leadsRepository}) : super(const LeadsInitial()) {
    on<FetchLeads>(onFetchLeads);
    on<SearchLeadsChanged>(onSearchLeadsChanged);
    on<FilterCategoryChanged>(onFilterCategoryChanged);
    on<ToggleSpotlight>(onToggleSpotlight);
    on<AddLead>(onAddLead);
    on<ApplyFilterOptions>(onApplyFilterOptions);
    on<LeadDeleted>(onLeadDeleted);

    _deletedSub = leadsRepository.leadDeletedStream.listen(
      (id) => add(LeadDeleted(id)),
    );
  }

  @override
  Future<void> close() {
    _deletedSub.cancel();
    leadsRepository.dispose();
    return super.close();
  }
}
