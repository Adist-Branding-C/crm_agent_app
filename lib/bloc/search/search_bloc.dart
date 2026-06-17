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
  List<Lead> _allLeads = const []; List<Task> _allTasks = const [];
  List<Spotlight> _allSpotlights = const []; List<FollowUp> _allFollowUps = const [];
  SearchBloc({
    required this.leadsRepo, required this.tasksRepo,
    required this.spotlightRepo, required this.followUpsRepo,
  }) : super(const SearchInitial()) {
    on<InitializeSearch>((e, emit) => _loadAllData(emit));
    on<SearchQueryChanged>(_onChange);
    on<ClearSearch>((e, emit) => _loadAllData(emit));
  }
  Future<void> _ensureLoaded() async {
    if (_allLeads.isNotEmpty) return;
    final res = await Future.wait([
      leadsRepo.getLeads(), tasksRepo.getTasks(),
      spotlightRepo.getSpotlights(), followUpsRepo.getFollowUps(),
    ]);
    _allLeads = res[0] as List<Lead>;
    _allTasks = res[1] as List<Task>;
    _allSpotlights = res[2] as List<Spotlight>;
    _allFollowUps = res[3] as List<FollowUp>;
  }
  Future<void> _loadAllData(Emitter<SearchState> emit) async {
    emit(const SearchLoading());
    try {
      await _ensureLoaded();
      emit(SearchInitial(
        recentQueries: List.unmodifiable(_recents),
        suggestedLeads: _allLeads.take(2).toList(),
        suggestedTasks: _allTasks.take(2).toList(),
        suggestedFollowUps: _allFollowUps.take(2).toList(),
      ));
    } catch (e) {
      emit(const SearchError(SearchFailure.load));
    }
  }
  Future<void> _onChange(SearchQueryChanged event, Emitter<SearchState> emit) async {
    final q = event.query.trim();
    if (q.isEmpty) return _loadAllData(emit);
    await _ensureLoaded();
    emit(const SearchLoading());
    try {
      final queryLower = q.toLowerCase();
      final ml = _allLeads.where((l) =>
          l.name.toLowerCase().contains(queryLower) || l.phone.contains(queryLower) ||
          l.location.toLowerCase().contains(queryLower)).map(LeadSearchResult.new);
      final mt = _allTasks.where((t) =>
          t.title.toLowerCase().contains(queryLower) ||
          (t.description?.toLowerCase().contains(queryLower) ?? false)).map(TaskSearchResult.new);
      final ms = _allSpotlights.where((s) =>
          s.title.toLowerCase().contains(queryLower) ||
          s.description.toLowerCase().contains(queryLower)).map(SpotlightSearchResult.new);
      final mf = _allFollowUps
          .where((f) => f.name.toLowerCase().contains(queryLower)).map(FollowUpSearchResult.new);
      _recents..remove(q)..insert(0, q); if (_recents.length > 3) _recents.removeLast();
      emit(SearchLoaded(query: event.query, results: [
        ...ml, ...mt, ...ms, ...mf,
      ]));
    } catch (e) {
      emit(const SearchError(SearchFailure.query));
    }
  }
}
