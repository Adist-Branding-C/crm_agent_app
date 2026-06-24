import 'package:flutter/material.dart';
import '../../../bloc/enquiry_details/enquiry_details_models.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../theme.dart';
import 'activity_tile.dart';

class ActivitiesTabView extends StatelessWidget {
  final List<EnquiryActivity> activities;
  final Lead lead;

  const ActivitiesTabView({
    super.key,
    required this.activities,
    required this.lead,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: AppSpacing.fabBottomPadding,
      itemCount: activities.length,
      itemBuilder: (context, index) {
        return ActivityTile(
          activity: activities[index],
          lead: lead,
          isFirst: index == 0,
          isLast: index == activities.length - 1,
        );
      },
    );
  }
}
