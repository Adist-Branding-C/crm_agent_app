import 'package:flutter/material.dart';
import '../../../bloc/attendance/attendance_models.dart';
import '../../../theme.dart';
import '../../../widgets/timeline_layout.dart';
import '../../../widgets/timeline_tile_config.dart';
import 'attendance_timeline_configs.dart';

/// Renders a single event in the activity timeline.
class TimelineTile extends StatelessWidget {
  final AttendanceTimelineItem item;
  final bool isFirst;
  final bool isLast;

  /// Creates a constant [TimelineTile].
  const TimelineTile({
    super.key,
    required this.item,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final config = AttendanceTimelineConfigs.getConfig(item.type);
    final textTheme = Theme.of(context).textTheme;
    final captionStyle = textTheme.bodyMedium?.copyWith(
      color: AppColors.textMuted,
      fontSize: 11,
      fontWeight: FontWeight.w500,
    );

    return TimelineLayout(
      isFirst: isFirst,
      isLast: isLast,
      config: config,
      child: Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: textTheme.titleMedium?.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(item.subtitle, style: captionStyle),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(item.time, style: captionStyle),
          ],
        ),
      ),
    );
  }
}


