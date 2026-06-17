import '../leads/leads_models.dart';
import '../tasks/tasks_models.dart';
import '../follow_ups/follow_ups_models.dart';
import '../../data/repositories/leads_repository.dart';
import '../../data/repositories/tasks_repository.dart';
import '../../data/repositories/spotlight_repository.dart';
import '../../data/repositories/follow_ups_repository.dart';

/// Lazily caches searchable entities across the search session.
class SearchCache {
  final LeadsRepository leadsRepo;
  final TasksRepository tasksRepo;
  final SpotlightRepository spotlightRepo;
  final FollowUpsRepository followUpsRepo;

  List<Lead> leads = const [];
  List<Task> tasks = const [];
  List<Spotlight> spotlights = const [];
  List<FollowUp> followUps = const [];

  final List<String> _recents = [];

  SearchCache({
    required this.leadsRepo,
    required this.tasksRepo,
    required this.spotlightRepo,
    required this.followUpsRepo,
  });

  List<String> get recents => List.unmodifiable(_recents);

  Future<void> ensureLoaded() async {
    if (leads.isNotEmpty) return;
    final res = await Future.wait([
      leadsRepo.getLeads(),
      tasksRepo.getTasks(),
      spotlightRepo.getSpotlights(),
      followUpsRepo.getFollowUps(),
    ]);
    leads = res[0] as List<Lead>;
    tasks = res[1] as List<Task>;
    spotlights = res[2] as List<Spotlight>;
    followUps = res[3] as List<FollowUp>;
  }

  void addRecent(String query) {
    _recents..remove(query)..insert(0, query);
    if (_recents.length > 3) _recents.removeLast();
  }
}