import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../bloc/tasks/tasks_models.dart';
import '../../../bloc/follow_ups/follow_ups_models.dart';
import '../../../theme.dart';
import '../../leads/widgets/lead_card.dart';
import '../../tasks/widgets/task_card.dart';
import '../../follow_ups/widgets/follow_up_item_card.dart';
import 'recent_section.dart';

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
      list.add(_header('SUGGESTED LEADS'));
      list.addAll(leads.map((l) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        child: LeadCard(lead: l),
      )));
    }
    if (tasks.isNotEmpty) {
      list.add(_header('SUGGESTED TASKS'));
      list.addAll(tasks.map((t) => TaskCard(task: t)));
    }
    if (followUps.isNotEmpty) {
      list.add(_header('SUGGESTED FOLLOW-UPS'));
      list.addAll(followUps.map((f) => FollowUpItemCard(call: f, onTap: () {})));
    }
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 24),
      children: list,
    );
  }

  Widget _header(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 16, bottom: 8),
      child: Text(title, style: const TextStyle(
        color: AppColors.textMuted,
        fontWeight: FontWeight.bold,
        fontSize: 12,
        letterSpacing: 0.8,
      )),
    );
  }
}
