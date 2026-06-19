import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/my_activity/my_activity_bloc.dart';
import '../../../data/models/my_activity/my_activity_model.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 24),
            physics: const BouncingScrollPhysics(),
            children: _buildGroups(state.groupedActivities),
          ),
        );
      },
    );
  }

  List<Widget> _buildGroups(List<ActivityDateGroup> groups) {
    final widgets = <Widget>[];
    for (final group in groups) {
      widgets.add(MyActivityDateHeader(dateLabel: group.dateLabel));
      for (var i = 0; i < group.items.length; i++) {
        widgets.add(MyActivityItemWidget(
          item: group.items[i],
          isFirst: i == 0,
          isLast: i == group.items.length - 1,
        ));
      }
    }
    return widgets;
  }
}
