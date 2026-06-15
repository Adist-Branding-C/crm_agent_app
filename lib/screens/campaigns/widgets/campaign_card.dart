import 'package:flutter/material.dart';
import '../../../bloc/campaigns/campaigns_models.dart';
import '../../../theme.dart';
import 'campaign_icon.dart';
import 'campaign_status_badge.dart';

/// Card component that displays details and progress for a single campaign.
class CampaignCard extends StatelessWidget {
  final Campaign campaign;

  /// Creates a constant [CampaignCard].
  const CampaignCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    final double progress = campaign.totalCount == 0
        ? 0
        : campaign.doneCount / campaign.totalCount;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CampaignIcon(campaign: campaign),
              const SizedBox(width: 12),
              Expanded(child: _buildDetails()),
              CampaignStatusBadge(campaign: campaign),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: progress,
              color: campaign.themeColor,
              backgroundColor: const Color(0xFFF1F5F9),
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

  Widget _buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          campaign.title,
          style: const TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          '${campaign.type} · by ${campaign.creator}',
          style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
        ),
      ],
    );
  }
}
