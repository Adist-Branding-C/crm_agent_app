import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/enquiry_details/enquiry_details_models.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../router/app_routes.dart';
import '../../../theme.dart';
import '../../../widgets/timeline_layout.dart';
import 'activities_config.dart';

class ActivityTile extends StatelessWidget {
  final EnquiryActivity activity;
  final Lead lead;
  final bool isFirst;
  final bool isLast;

  const ActivityTile({
    super.key,
    required this.activity,
    required this.lead,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final config = activitiesConfigs[activity.type];
    if (config == null) return const SizedBox.shrink();

    final tileChild = Padding(
      padding: EdgeInsets.only(top: AppSpacing.xs2, bottom: AppSpacing.xl),
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
          AppSpacing.gapXxs,
          Text(
            activity.time,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );

    return TimelineLayout(
      isFirst: isFirst,
      isLast: isLast,
      config: config,
      child: activity.type == EnquiryActivityType.call
          ? InkWell(
              onTap: () {
                context.pushNamed(
                  AppRoutes.viewCallLog,
                  extra: {'lead': lead, 'activity': activity},
                );
              },
              borderRadius: BorderRadius.circular(4),
              child: tileChild,
            )
          : tileChild,
    );
  }
}
