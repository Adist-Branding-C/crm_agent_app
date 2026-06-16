import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/leads_repository.dart';
import '../../data/repositories/tasks_repository.dart';
import '../../data/repositories/spotlight_repository.dart';
import '../../data/repositories/follow_ups_repository.dart';
import '../leads/leads_models.dart';
import '../tasks/tasks_models.dart';
import '../follow_ups/follow_ups_models.dart';
import 'search_result.dart';

part 'search_event.dart';
part 'search_state.dart';

/// Business logic component for global application search.
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final LeadsRepository leadsRepo;
  final TasksRepository tasksRepo;
  final SpotlightRepository spotlightRepo;
  final FollowUpsRepository followUpsRepo;

  /// Creates a [SearchBloc] injecting the repositories.
  SearchBloc({
    required this.leadsRepo, required this.tasksRepo,
    required this.spotlightRepo, required this.followUpsRepo,
  }) : super(const SearchInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onSearchQueryChanged(
    SearchQueryChanged event, Emitter<SearchState> emit,
  ) async {
    final query = event.query.trim().toLowerCase();
    if (query.isEmpty) return emit(const SearchInitial());

    emit(const SearchLoading());
    try {
      final results = await Future.wait([
        leadsRepo.getLeads(), tasksRepo.getTasks(),
        spotlightRepo.getSpotlights(), followUpsRepo.getFollowUps(),
      ]);

      final matchedLeads = (results[0] as List<Lead>).where((l) =>
          l.name.toLowerCase().contains(query) ||
          l.phone.toLowerCase().contains(query) ||
          l.location.toLowerCase().contains(query)).map(LeadSearchResult.new);

      final matchedTasks = (results[1] as List<Task>).where((t) =>
          t.title.toLowerCase().contains(query) ||
          (t.description?.toLowerCase().contains(query) ?? false)).map(TaskSearchResult.new);

      final matchedSpotlights = (results[2] as List<Spotlight>).where((s) =>
          s.title.toLowerCase().contains(query) ||
          s.description.toLowerCase().contains(query)).map(SpotlightSearchResult.new);

      final matchedFollowUps = (results[3] as List<FollowUp>)
          .where((f) => f.name.toLowerCase().contains(query)).map(FollowUpSearchResult.new);

      emit(SearchLoaded(query: event.query, results: [
        ...matchedLeads, ...matchedTasks, ...matchedSpotlights, ...matchedFollowUps,
      ]));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  void _onClearSearch(ClearSearch event, Emitter<SearchState> emit) =>
      emit(const SearchInitial());
}
