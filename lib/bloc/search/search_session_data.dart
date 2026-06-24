import 'package:equatable/equatable.dart';
import '../leads/leads_models.dart';
import '../tasks/tasks_models.dart';
import '../follow_ups/follow_ups_models.dart';
import '../../data/repositories/spotlight_repository.dart';

class SearchSessionData extends Equatable {
  final List<Lead> leads;
  final List<Task> tasks;
  final List<Spotlight> spotlights;
  final List<FollowUp> followUps;
  final List<String> recentQueries;

  const SearchSessionData({
    this.leads = const [],
    this.tasks = const [],
    this.spotlights = const [],
    this.followUps = const [],
    this.recentQueries = const [],
  });

  SearchSessionData copyWith({
    List<Lead>? leads,
    List<Task>? tasks,
    List<Spotlight>? spotlights,
    List<FollowUp>? followUps,
    List<String>? recentQueries,
  }) {
    return SearchSessionData(
      leads: leads ?? this.leads,
      tasks: tasks ?? this.tasks,
      spotlights: spotlights ?? this.spotlights,
      followUps: followUps ?? this.followUps,
      recentQueries: recentQueries ?? this.recentQueries,
    );
  }

  SearchSessionData withRecentQuery(String query) {
    final updated = List<String>.from(recentQueries)
      ..remove(query)
      ..insert(0, query);
    return copyWith(
      recentQueries: updated.take(3).toList(),
    );
  }

  @override
  List<Object?> get props => [leads, tasks, spotlights, followUps, recentQueries];
}
