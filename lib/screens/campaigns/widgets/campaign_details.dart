import 'package:flutter/material.dart';
import '../../../bloc/campaigns/campaigns_models.dart';
import '../../../theme/app_colors.dart';
import '../../../theme.dart';

/// Renders the title and meta information for a Campaign.
class CampaignDetails extends StatelessWidget {
  /// The campaign model.
  final Campaign campaign;

  /// Creates a [CampaignDetails] widget.
  const CampaignDetails({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          campaign.title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          '${campaign.type.label} · by ${campaign.creator}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}
