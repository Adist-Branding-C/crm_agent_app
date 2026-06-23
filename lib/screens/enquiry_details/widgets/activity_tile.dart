import 'package:flutter/material.dart';
import '../../../bloc/enquiry_details/enquiry_details_models.dart';
import '../../../theme.dart';
import '../../../widgets/timeline_layout.dart';
import 'activities_config.dart';

class ActivityTile extends StatelessWidget {
  final EnquiryActivity activity;
  final bool isFirst;
  final bool isLast;

  const ActivityTile({
    super.key,
    required this.activity,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final config = activitiesConfigs[activity.type];
    if (config == null) return const SizedBox.shrink();

    return TimelineLayout(
      isFirst: isFirst,
      isLast: isLast,
      config: config,
      child: Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              activity.title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              activity.time,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
