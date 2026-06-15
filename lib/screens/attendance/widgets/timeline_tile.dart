import 'package:flutter/material.dart';
import '../../../bloc/attendance/attendance_models.dart';
import '../../../theme.dart';
import 'timeline_tile_config.dart';

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
    final config = TimelineTileConfig.getConfig(item.type);
    final textTheme = Theme.of(context).textTheme;
    const lineColor = Color(0xFFE2E8F0);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 48,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                if (!isLast)
                  Positioned(
                    top: 16,
                    bottom: 0,
                    child: Container(width: 1.5, color: lineColor),
                  ),
                if (!isFirst)
                  Positioned(
                    top: 0,
                    bottom: 16,
                    child: Container(width: 1.5, color: lineColor),
                  ),
                Positioned(
                  top: 0,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: config.bgColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(config.icon, color: config.iconColor, size: 16),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
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
                        Text(
                          item.subtitle,
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColors.textMuted,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    item.time,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
