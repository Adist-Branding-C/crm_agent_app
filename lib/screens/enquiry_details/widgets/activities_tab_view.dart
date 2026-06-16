import 'package:flutter/material.dart';
import '../../../bloc/enquiry_details/enquiry_details_models.dart';
import '../../../theme.dart';
import '../../../widgets/timeline_layout.dart';
import 'activities_config.dart';

/// Renders the Activities tab showing a vertical history timeline.
class ActivitiesTabView extends StatelessWidget {
  final List<EnquiryActivity> activities;
  const ActivitiesTabView({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 80),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        return _buildActivityTile(
          activities[index],
          index == 0,
          index == activities.length - 1,
        );
      },
    );
  }

  Widget _buildActivityTile(EnquiryActivity act, bool isFirst, bool isLast) {
    final config = activitiesConfigs[act.type];
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
              act.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              act.time,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
