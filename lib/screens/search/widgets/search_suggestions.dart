import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../bloc/follow_ups/follow_ups_models.dart';
import '../../leads/widgets/lead_card.dart';
import 'recent_section.dart';
import 'search_follow_up_tile.dart';
import 'search_section_header.dart';
import 'suggested_tasks_list.dart';

/// Renders the sectioned list of suggested items when search is empty or focused.
class SearchSuggestions extends StatelessWidget {
  final List<String> recentQueries;
  final ValueChanged<String> onTapRecent;
  final List<Lead> leads;
  final List<Task> tasks;
  final List<FollowUp> followUps;

  const SearchSuggestions({
    super.key,
    required this.recentQueries,
    required this.onTapRecent,
    required this.leads,
    required this.tasks,
    required this.followUps,
  });

  @override
  Widget build(BuildContext context) {
    final list = <Widget>[];
    if (recentQueries.isNotEmpty) {
      list.add(Padding(
        padding: const EdgeInsets.only(top: 8),
        child: RecentSection(queries: recentQueries, onTap: onTapRecent),
      ));
    }
    if (leads.isNotEmpty) {
      list.add(const SearchSectionHeader(title: 'SUGGESTED LEADS'));
      list.addAll(leads.map((l) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        child: LeadCard(lead: l),
      )));
    }
    if (tasks.isNotEmpty) {
      list.add(const SearchSectionHeader(title: 'SUGGESTED TASKS'));
      list.add(SuggestedTasksList(tasks: tasks));
    }
    if (followUps.isNotEmpty) {
      list.add(const SearchSectionHeader(title: 'SUGGESTED FOLLOW-UPS'));
      list.addAll(followUps.map((f) => SearchFollowUpTile(followUp: f)));
    }
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 24),
      children: list,
    );
  }
}
