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

  @override
  Future<void> close() {
    _deletedSub.cancel();
    _updatedSub.cancel();
    return super.close();
  }
}
