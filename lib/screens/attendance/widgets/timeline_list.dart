import 'package:flutter/material.dart';
import '../../../bloc/attendance/attendance_models.dart';
import '../../../theme.dart';
import 'timeline_tile.dart';

/// Renders the section for "Today's Timeline" and list of tiles.
class TimelineList extends StatelessWidget {
  /// The list of daily activities.
  final List<AttendanceTimelineItem> items;

  /// Creates a constant [TimelineList].
  const TimelineList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today's Timeline",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 16),
        if (items.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: Text(
                'No activities logged today.',
                style: TextStyle(color: AppColors.textMuted, fontSize: 13),
              ),
            ),
          )
        else
          Column(
            children: List.generate(items.length, (index) {
              return TimelineTile(
                item: items[index],
                isFirst: index == 0,
                isLast: index == items.length - 1,
              );
            }),
          ),
      ],
    );
  }
}
