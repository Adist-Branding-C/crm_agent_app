import 'package:flutter/material.dart';
import '../../../bloc/enquiry_details/enquiry_details_models.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';
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
    if (activities.isEmpty) {
      return Center(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: AppSpacing.fabBottomPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.history,
                size: 34.s,
                color: AppColors.slate400,
              ),
            AppSpacing.gapMd,
              Text(
                'No Activities Yet',
                style: TextStyle(
                  fontSize: 14.s,
                  color: AppColors.textDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpacing.gapSm,
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
                child: Text(
                  'Activities related to this enquiry will show up here.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11.s,
                    color: AppColors.textMuted,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

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

