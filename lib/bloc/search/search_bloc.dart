import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/leads_repository.dart';
import '../../data/repositories/tasks_repository.dart';
import '../../data/repositories/spotlight_repository.dart';
import '../../data/repositories/follow_ups_repository.dart';
import 'search_event.dart';
import 'search_state.dart';
import 'search_handlers.dart';

export 'search_event.dart';
export 'search_state.dart';
export 'search_result.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final LeadsRepository leadsRepo;
  final TasksRepository tasksRepo;
  final SpotlightRepository spotlightRepo;
  final FollowUpsRepository followUpsRepo;
  final List<String> recentQueries = [];

  SearchBloc({
    required this.leadsRepo,
    required this.tasksRepo,
    required this.spotlightRepo,
    required this.followUpsRepo,
  }) : super(const SearchInitial()) {
    on<InitializeSearch>((e, emit) => loadAllData(emit));
    on<SearchQueryChanged>(onQueryChanged);
    on<ClearSearch>((e, emit) => loadAllData(emit));
  }
}
