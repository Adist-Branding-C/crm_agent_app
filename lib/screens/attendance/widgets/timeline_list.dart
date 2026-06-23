import 'package:flutter/material.dart';
import '../../../bloc/attendance/attendance_models.dart';
import '../../../theme.dart';
import 'attendance_timeline_tile.dart';

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
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 16),
        if (items.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: Text(
                'No activities logged today.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ),
          )
        else
          Column(
            children: List.generate(items.length, (index) {
              return AttendanceTimelineTile(
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
