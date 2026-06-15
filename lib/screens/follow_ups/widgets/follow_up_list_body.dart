import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/follow_ups/follow_ups_bloc.dart';
import '../../../bloc/follow_ups/follow_ups_models.dart';
import 'follow_up_section_header.dart';
import 'follow_up_item_card.dart';

/// Renders the categorised sections of follow-ups.
class FollowUpListBody extends StatelessWidget {
  /// Complete list of follow-ups.
  final List<FollowUp> calls;

  /// Creates a constant [FollowUpListBody].
  const FollowUpListBody({super.key, required this.calls});

  @override
  Widget build(BuildContext context) {
    final overdue = calls.where((f) => f.urgency == 'overdue').toList();
    final dueToday = calls.where((f) => f.urgency == 'due_today').toList();
    final upcoming = calls.where((f) => f.urgency == 'upcoming').toList();

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        if (overdue.isNotEmpty) ...[
          FollowUpSectionHeader(
            title: 'Overdue',
            count: overdue.length,
            urgency: 'overdue',
          ),
          ...overdue.map((c) => FollowUpItemCard(
                call: c,
                onTap: () => context.read<FollowUpsBloc>().add(TriggerCall(c.id)),
              )),
          const SizedBox(height: 8),
        ],
        if (dueToday.isNotEmpty) ...[
          FollowUpSectionHeader(
            title: 'Due Today',
            count: dueToday.length,
            urgency: 'due_today',
          ),
          ...dueToday.map((c) => FollowUpItemCard(
                call: c,
                onTap: () => context.read<FollowUpsBloc>().add(TriggerCall(c.id)),
              )),
          const SizedBox(height: 8),
        ],
        if (upcoming.isNotEmpty) ...[
          FollowUpSectionHeader(
            title: 'Upcoming',
            count: upcoming.length,
            urgency: 'upcoming',
          ),
          ...upcoming.map((c) => FollowUpItemCard(
                call: c,
                onTap: () => context.read<FollowUpsBloc>().add(TriggerCall(c.id)),
              )),
          const SizedBox(height: 16),
        ],
      ],
    );
  }
}
