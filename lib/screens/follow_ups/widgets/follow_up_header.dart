import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/follow_ups/follow_ups_bloc.dart';
import '../../../bloc/follow_ups/follow_ups_models.dart';
import '../../../widgets/screen_header.dart';
import '../../../theme.dart';

/// Header widget for Follow-ups Screen showing back button and titles.
class FollowUpHeader extends StatelessWidget {
  /// Creates a constant [FollowUpHeader].
  const FollowUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHeader(
      title: 'Follow-ups',
      subtitleWidget: BlocBuilder<FollowUpsBloc, FollowUpsState>(
        buildWhen: (prev, curr) => curr is FollowUpsLoaded,
        builder: (context, state) {
          var dueTodayCount = 0;
          if (state is FollowUpsLoaded) {
            dueTodayCount = state.followUps
                .where((f) => f.urgency == FollowUpUrgency.dueToday)
                .length;
          }
          return Text(
            '$dueTodayCount due today',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textMuted,
              fontWeight: FontWeight.w500,
            ),
          );
        },
      ),
      showBackButton: true,
    );
  }
}
