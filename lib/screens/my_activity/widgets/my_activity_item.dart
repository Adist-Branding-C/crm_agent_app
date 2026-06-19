import 'package:flutter/material.dart';
import '../../../data/models/my_activity/my_activity_model.dart';
import '../../../widgets/timeline_layout.dart';
import '../../../widgets/timeline_tile_config.dart';
import '../../../theme.dart';
import 'activity_title_row.dart';
import 'activity_metadata_row.dart';
import 'activity_icon_config.dart';

/// A single activity item rendered as a timeline tile.
class MyActivityItemWidget extends StatelessWidget {
  final MyActivityItem item;
  final bool isFirst;
  final bool isLast;

  const MyActivityItemWidget({
    super.key,
    required this.item,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final iconConfig = getActivityIconConfig(item.entityType);
    return TimelineLayout(
      isFirst: isFirst,
      isLast: isLast,
      config: TimelineTileConfig(
        icon: iconConfig.icon,
        iconColor: iconConfig.iconColor,
        bgColor: iconConfig.bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActivityTitleRow(title: item.title, status: item.status),
            const SizedBox(height: 4),
            Text(
              item.description,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textMuted,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            ActivityMetadataRow(assignee: item.assignee, time: item.time),
          ],
        ),
      ),
    );
  }
}
