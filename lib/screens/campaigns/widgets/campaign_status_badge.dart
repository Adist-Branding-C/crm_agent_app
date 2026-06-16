import '../../../theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../bloc/campaigns/campaigns_models.dart';
import 'campaign_presentation_extensions.dart';

/// Renders either the completion percentage or the 'Done' status badge.
class CampaignStatusBadge extends StatelessWidget {
  final Campaign campaign;

  /// Creates a constant [CampaignStatusBadge].
  const CampaignStatusBadge({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    if (campaign.isCompleted) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.successBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_rounded, color: AppColors.success, size: 12),
            SizedBox(width: 4),
            Text(
              'Done',
              style: TextStyle(
                color: AppColors.success,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ],
        ),
      );
    }

    return Text(
      '${campaign.progressPercent}%',
      style: TextStyle(
        color: campaign.themeColor,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }
}
