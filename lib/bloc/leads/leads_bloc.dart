import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/leads_repository.dart';
import 'leads_enums.dart';
import 'leads_filter_helper.dart';
import 'leads_models.dart';

part 'leads_event.dart';
part 'leads_state.dart';
part 'leads_state_loaded.dart';
part 'leads_handlers.dart';

/// Business logic component managing lead lists, searching, and filtering.
class LeadsBloc extends Bloc<LeadsEvent, LeadsState> {
  /// The leads repository.
  final LeadsRepository leadsRepository;
  late final StreamSubscription<String> _deletedSub;

  /// Initializes the BLoC with [LeadsInitial].
  LeadsBloc({required this.leadsRepository}) : super(const LeadsInitial()) {
    on<FetchLeads>(_onFetchLeads);
    on<SearchLeadsChanged>(_onSearchLeadsChanged);
    on<FilterCategoryChanged>(_onFilterCategoryChanged);
    on<ToggleSpotlight>(_onToggleSpotlight);
    on<AddLead>(_onAddLead);
    on<ApplyFilterOptions>(_onApplyFilterOptions);
    on<LeadDeleted>(_onLeadDeleted);

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
