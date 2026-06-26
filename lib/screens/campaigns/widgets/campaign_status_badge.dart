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
    
    return Text(
      '${campaign.progressPercent}%',
      style: TextStyle(
        color: AppColors.primaryLightColor,
        fontWeight: FontWeight.bold,
        fontSize: 12.s,
      ),
    );
  }
}
