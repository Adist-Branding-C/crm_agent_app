import 'package:flutter/material.dart';
import '../../screens/leads/widgets/lead_card.dart';
import '../../screens/tasks/widgets/task_card.dart';
import '../../screens/search/widgets/spotlight_card.dart';
import '../../screens/follow_ups/widgets/follow_up_item_card.dart';
import '../leads/leads_models.dart';
import '../tasks/tasks_models.dart';
import '../follow_ups/follow_ups_models.dart';
import '../../data/repositories/spotlight_repository.dart';

/// Polymorphic representation of a search result item.
abstract class SearchResult {
  String get id;
  String get title;
  String get categoryName;
  Widget buildTile(BuildContext context);
}

/// A search result wrapper for a [Lead].
class LeadSearchResult implements SearchResult {
  final Lead lead;
  const LeadSearchResult(this.lead);
  @override
  String get id => lead.id;
  @override
  String get title => lead.name;
  @override
  String get categoryName => 'Leads';
  @override
  Widget buildTile(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        child: LeadCard(lead: lead),
      );
}

/// A search result wrapper for a [Task].
class TaskSearchResult implements SearchResult {
  final Task task;
  const TaskSearchResult(this.task);
  @override
  String get id => task.id;
  @override
  String get title => task.title;
  @override
  String get categoryName => 'Tasks';
  @override
  Widget buildTile(BuildContext context) => TaskCard(task: task);
}

/// A search result wrapper for a [Spotlight].
class SpotlightSearchResult implements SearchResult {
  final Spotlight spotlight;
  const SpotlightSearchResult(this.spotlight);
  @override
  String get id => spotlight.id;
  @override
  String get title => spotlight.title;
  @override
  String get categoryName => 'Spotlights';
  @override
  Widget buildTile(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        child: SpotlightCard(spotlight: spotlight),
      );
}

/// A search result wrapper for a [FollowUp].
class FollowUpSearchResult implements SearchResult {
  final FollowUp followUp;
  const FollowUpSearchResult(this.followUp);
  @override
  String get id => followUp.id;
  @override
  String get title => followUp.name;
  @override
  String get categoryName => 'Follow-ups';
  @override
  Widget buildTile(BuildContext context) => FollowUpItemCard(
        call: followUp,
        onTap: () {},
      );
}
