import 'package:flutter/material.dart';
import '../../../bloc/campaigns/campaigns_models.dart';
import '../../../widgets/custom_card.dart';
import '../../../theme.dart';
import 'campaign_icon.dart';
import 'campaign_status_badge.dart';
import 'campaign_details.dart';

/// Card component that displays details and progress for a single campaign.
class CampaignCard extends StatelessWidget {
  /// The campaign model.
  final Campaign campaign;

  /// Creates a constant [CampaignCard].
  const CampaignCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    final double progress = campaign.totalCount == 0
        ? 0
        : campaign.doneCount / campaign.totalCount;

    return CustomCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CampaignIcon(campaign: campaign),
              const SizedBox(width: 12),
              Expanded(child: CampaignDetails(campaign: campaign)),
              CampaignStatusBadge(campaign: campaign),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: progress,
              color: campaign.themeColor,
              backgroundColor: AppColors.slate100,
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${campaign.doneCount} of ${campaign.totalCount} done',
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 11,
                ),
              ),
              Text(
                '${campaign.remainingCount} remaining',
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
