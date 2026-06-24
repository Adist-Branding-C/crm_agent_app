import 'package:flutter/material.dart';
import '../../../bloc/campaigns/campaigns_models.dart';
import 'campaign_presentation_extensions.dart';
import '../../../utils/context_text_extension.dart';
import '../../../theme.dart';

/// Renders either the completion percentage or the 'Done' status badge.
class CampaignStatusBadge extends StatelessWidget {
  final Campaign campaign;

  /// Creates a constant [CampaignStatusBadge].
  const CampaignStatusBadge({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    if (campaign.isCompleted) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: AppColors.successBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_rounded, color: AppColors.success, size: 12),
            AppSpacing.gapWXs,
            Text(
              'Done',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.success,
                fontWeight: FontWeight.bold,
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
        fontSize: context.scaleFont(14),
      ),
    );
  }
}
