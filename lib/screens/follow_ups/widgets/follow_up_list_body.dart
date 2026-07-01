import 'package:flutter/material.dart';
import '../../../bloc/follow_ups/follow_ups_models.dart';
import '../../../theme.dart';
import 'follow_up_group_section.dart';

/// Renders the categorised sections of follow-ups.
class FollowUpListBody extends StatelessWidget {
  /// Complete list of follow-ups.
  final List<FollowUp> calls;

  /// Creates a constant [FollowUpListBody].
  const FollowUpListBody({super.key, required this.calls});

  @override
  Widget build(BuildContext context) {
    final overdue = calls
        .where((f) => f.urgency == FollowUpUrgency.overdue)
        .toList();
    final dueToday = calls
        .where((f) => f.urgency == FollowUpUrgency.dueToday)
        .toList();
    final upcoming = calls
        .where((f) => f.urgency == FollowUpUrgency.upcoming)
        .toList();

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        FollowUpGroupSection(
          title: 'Overdue',
          items: overdue,
          leadingIcon: Icons.warning_amber_rounded,
          leadingIconColor: AppColors.errorColor,
          badgeBgColor: AppColors.primaryColorLight,
          badgeTextColor: AppColors.errorColor,
        ),
        FollowUpGroupSection(
          title: 'Due Today',
          items: dueToday,
          leadingIcon: Icons.access_time_rounded,
          leadingIconColor: AppColors.errorColor,
          badgeBgColor: AppColors.primaryColorLight,
          badgeTextColor: AppColors.errorColor,
        ),
        FollowUpGroupSection(
          title: 'Upcoming',
          items: upcoming,
          leadingIcon: Icons.calendar_month_rounded,
          leadingIconColor: AppColors.info,
          badgeBgColor: AppColors.infoBackgroundLight,
          badgeTextColor: AppColors.infoText,
        ),
      ],
    );
  }
}
