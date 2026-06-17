import 'package:flutter/material.dart';
import '../../../bloc/enquiry_details/enquiry_details_models.dart';
import 'activity_tile.dart';

class ActivitiesTabView extends StatelessWidget {
  final List<EnquiryActivity> activities;
  const ActivitiesTabView({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 80),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        return ActivityTile(
          activity: activities[index],
          isFirst: index == 0,
          isLast: index == activities.length - 1,
        );
      },
    );
  }
}
