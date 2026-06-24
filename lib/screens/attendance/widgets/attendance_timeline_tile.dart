import 'package:flutter/material.dart';
import '../../../bloc/attendance/attendance_models.dart';
import '../../../theme.dart';
import '../../../widgets/timeline_layout.dart';
import 'attendance_timeline_configs.dart';

class AttendanceTimelineTile extends StatelessWidget {
  final AttendanceTimelineItem item;
  final bool isFirst;
  final bool isLast;

  const AttendanceTimelineTile({
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
      fontWeight: FontWeight.w500,
    );

    return TimelineLayout(
      isFirst: isFirst,
      isLast: isLast,
      config: config,
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppSpacing.xxs,
          bottom: AppSpacing.xl,
        ),
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
                    ),
                  ),
                  AppSpacing.gapXs,
                  Text(item.subtitle, style: captionStyle),
                ],
              ),
            ),
            AppSpacing.gapWSm,
            Text(item.time, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
