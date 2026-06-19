import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/leads_repository.dart';

import 'leads_event.dart';
import 'leads_state.dart';
import 'leads_handlers.dart';

export 'leads_event.dart';
export 'leads_state.dart';
export 'leads_state_loaded.dart';

/// Business logic component managing lead lists, searching, and filtering.
class LeadsBloc extends Bloc<LeadsEvent, LeadsState> {
  /// The leads repository.
  final LeadsRepository leadsRepository;
  late final StreamSubscription<String> _deletedSub;

  /// Initializes the BLoC with [LeadsInitial].
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
