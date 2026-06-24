import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme.dart';
import '../../../bloc/my_activity/my_activity_bloc.dart';
import 'my_activity_item.dart';
import 'my_activity_date_header.dart';
import 'my_activity_empty_state.dart';

/// Builds the scrollable list of activity groups.
class MyActivityList extends StatelessWidget {
  const MyActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyActivityBloc, MyActivityState>(
      builder: (context, state) {
        if (state is! MyActivityLoaded) {
          return const SizedBox.shrink();
        }
        if (state.groupedActivities.isEmpty) {
          return const MyActivityEmptyState();
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
            physics: const BouncingScrollPhysics(),
            children: [
              for (final group in state.groupedActivities) ...[
                MyActivityDateHeader(dateLabel: group.dateLabel),
                for (var i = 0; i < group.items.length; i++)
                  MyActivityItemWidget(
                    item: group.items[i],
                    isFirst: i == 0,
                    isLast: i == group.items.length - 1,
                  ),
              ],
            ],
          ),
        );
      },
    );
  }
}
