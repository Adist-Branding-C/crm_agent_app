import '../../../theme/app_colors.dart';
import '../../../theme/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/call_log/call_log_bloc.dart';
import '../../../bloc/follow_ups/follow_ups_models.dart';
import '../../../widgets/section_header.dart';
import 'follow_up_item_card.dart';

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
        if (overdue.isNotEmpty) ...[
          SectionHeader(
            title: 'Overdue',
            countBadge: overdue.length,
            leadingIcon: Icons.warning_amber_rounded,
            leadingIconColor: AppColors.errorColor,
            badgeBgColor: AppColors.primaryColorLight,
            badgeTextColor: AppColors.errorColor,
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.xxl,
              vertical: AppSpacing.md,
            ),
          ),
          ...overdue.map(
            (c) => FollowUpItemCard(
              call: c,
              onCallTap: () => context.read<CallLogBloc>().add(
                InitiateCallByName(name: c.name),
              ),
            ),
          ),
          AppSpacing.gapSm,
        ],
        if (dueToday.isNotEmpty) ...[
          SectionHeader(
            title: 'Due Today',
            countBadge: dueToday.length,
            leadingIcon: Icons.access_time_rounded,
            leadingIconColor: AppColors.errorColor,
            badgeBgColor: AppColors.primaryColorLight,
            badgeTextColor: AppColors.errorColor,
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.xxl,
              vertical: AppSpacing.md,
            ),
          ),
          ...dueToday.map(
            (c) => FollowUpItemCard(
              call: c,
              onCallTap: () => context.read<CallLogBloc>().add(
                InitiateCallByName(name: c.name),
              ),
            ),
          ),
          AppSpacing.gapSm,
        ],
        if (upcoming.isNotEmpty) ...[
          SectionHeader(
            title: 'Upcoming',
            countBadge: upcoming.length,
            leadingIcon: Icons.calendar_month_rounded,
            leadingIconColor: AppColors.info,
            badgeBgColor: AppColors.infoBackgroundLight,
            badgeTextColor: AppColors.infoText,
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.xxl,
              vertical: AppSpacing.md,
            ),
          ),
          ...upcoming.map(
            (c) => FollowUpItemCard(
              call: c,
              onCallTap: () => context.read<CallLogBloc>().add(
                InitiateCallByName(name: c.name),
              ),
            ),
          ),
          AppSpacing.gapLg,
        ],
      ],
    );
  }
}
