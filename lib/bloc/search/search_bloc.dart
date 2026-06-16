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
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final LeadsRepository leadsRepo;
  final TasksRepository tasksRepo;
  final SpotlightRepository spotlightRepo;
  final FollowUpsRepository followUpsRepo;
  final List<String> _recents = [];
  List<Lead> _sLeads = []; List<Task> _sTasks = []; List<FollowUp> _sFollows = [];

  SearchBloc({
    required this.leadsRepo, required this.tasksRepo,
    required this.spotlightRepo, required this.followUpsRepo,
  }) : super(const SearchInitial()) {
    on<InitializeSearch>((e, emit) => _loadSuggestions(emit));
    on<SearchQueryChanged>(_onChange);
    on<ClearSearch>((e, emit) => _loadSuggestions(emit));
  }

  Future<void> _loadSuggestions(Emitter<SearchState> emit) async {
    emit(const SearchLoading());
    try {
      final res = await Future.wait([
        leadsRepo.getLeads(), tasksRepo.getTasks(), followUpsRepo.getFollowUps()
      ]);
      _sLeads = (res[0] as List<Lead>).take(2).toList();
      _sTasks = (res[1] as List<Task>).take(2).toList();
      _sFollows = (res[2] as List<FollowUp>).take(2).toList();
      emit(SearchInitial(
        recentQueries: List.unmodifiable(_recents),
        suggestedLeads: _sLeads, suggestedTasks: _sTasks, suggestedFollowUps: _sFollows,
      ));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  Future<void> _onChange(SearchQueryChanged event, Emitter<SearchState> emit) async {
    final q = event.query.trim();
    if (q.isEmpty) return _loadSuggestions(emit);
    emit(const SearchLoading());
    try {
      final res = await Future.wait([
        leadsRepo.getLeads(), tasksRepo.getTasks(),
        spotlightRepo.getSpotlights(), followUpsRepo.getFollowUps(),
      ]);
      final queryLower = q.toLowerCase();
      final ml = (res[0] as List<Lead>).where((l) =>
          l.name.toLowerCase().contains(queryLower) || l.phone.contains(queryLower) ||
          l.location.toLowerCase().contains(queryLower)).map(LeadSearchResult.new);
      final mt = (res[1] as List<Task>).where((t) =>
          t.title.toLowerCase().contains(queryLower) ||
          (t.description?.toLowerCase().contains(queryLower) ?? false)).map(TaskSearchResult.new);
      final ms = (res[2] as List<Spotlight>).where((s) =>
          s.title.toLowerCase().contains(queryLower) ||
          s.description.toLowerCase().contains(queryLower)).map(SpotlightSearchResult.new);
      final mf = (res[3] as List<FollowUp>)
          .where((f) => f.name.toLowerCase().contains(queryLower)).map(FollowUpSearchResult.new);
      _recents..remove(q)..insert(0, q); if (_recents.length > 3) _recents.removeLast();
      emit(SearchLoaded(query: event.query, results: [
        ...ml, ...mt, ...ms, ...mf,
      ]));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
