import 'package:flutter/material.dart';
import '../../../bloc/campaigns/campaigns_models.dart';
import '../../../widgets/custom_card.dart';
import '../../../theme.dart';
import 'campaign_icon.dart';
import 'campaign_status_badge.dart';
import 'campaign_presentation_extensions.dart';
import 'campaign_details.dart';

/// Card component that displays details and progress for a single campaign.
class CampaignCard extends StatelessWidget {
  final Campaign campaign;

  const CampaignCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    final double progress = campaign.totalCount == 0
        ? 0
        : campaign.doneCount / campaign.totalCount;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;

    return CustomCard(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CampaignIcon(campaign: campaign),
              AppSpacing.gapWMd,
              Expanded(child: CampaignDetails(campaign: campaign)),
              CampaignStatusBadge(campaign: campaign),
            ],
          ),
          AppSpacing.gapLg,
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: progress,
              color: campaign.themeColor,
              backgroundColor: AppColors.slate100,
              minHeight: 6,
            ),
          ),
          AppSpacing.gapMd,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${campaign.doneCount} of ${campaign.totalCount} done',
                style: captionStyle,
              ),
              Text('${campaign.remainingCount} remaining', style: captionStyle),
            ],
          ),
        ],
      ),
    );
  }
}
