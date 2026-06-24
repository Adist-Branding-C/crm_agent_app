import '../../data/repositories/leads_repository.dart';
import '../../data/repositories/tasks_repository.dart';
import '../../data/repositories/spotlight_repository.dart';
import '../../data/repositories/follow_ups_repository.dart';
import '../leads/leads_models.dart';
import '../tasks/tasks_models.dart';
import '../follow_ups/follow_ups_models.dart';
import 'search_result.dart';
import 'search_session_data.dart';

Map<String, List<SearchResult>> groupResults(List<SearchResult> results) {
  final Map<String, List<SearchResult>> groups = {};
  for (final result in results) {
    groups.putIfAbsent(result.categoryName, () => []).add(result);
  }
  return groups;
}

Future<SearchSessionData> loadSearchSession({
  required LeadsRepository leadsRepo,
  required TasksRepository tasksRepo,
  required SpotlightRepository spotlightRepo,
  required FollowUpsRepository followUpsRepo,
}) async {
  final res = await Future.wait([
    leadsRepo.getLeads(),
    tasksRepo.getTasks(),
    spotlightRepo.getSpotlights(),
    followUpsRepo.getFollowUps(),
  ]);
  return SearchSessionData(
    leads: res[0] as List<Lead>,
    tasks: res[1] as List<Task>,
    spotlights: res[2] as List<Spotlight>,
    followUps: res[3] as List<FollowUp>,
  );
}

List<SearchResult> searchEntities(
  SearchSessionData session,
  String queryLower,
) {
  final ml = session.leads
      .where(
        (l) =>
            l.name.toLowerCase().contains(queryLower) ||
            l.phone.contains(queryLower) ||
            l.location.toLowerCase().contains(queryLower),
      )
      .map(LeadSearchResult.new);
  final mt = session.tasks
      .where(
        (t) =>
            t.title.toLowerCase().contains(queryLower) ||
            (t.description?.toLowerCase().contains(queryLower) ?? false),
      )
      .map(TaskSearchResult.new);
  final ms = session.spotlights
      .where(
        (s) =>
            s.title.toLowerCase().contains(queryLower) ||
            s.description.toLowerCase().contains(queryLower),
      )
      .map(SpotlightSearchResult.new);
  final mf = session.followUps
      .where((f) => f.name.toLowerCase().contains(queryLower))
      .map(FollowUpSearchResult.new);
  return [...ml, ...mt, ...ms, ...mf];
}
