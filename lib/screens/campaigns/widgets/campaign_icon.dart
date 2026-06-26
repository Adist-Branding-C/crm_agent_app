import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import '../../../bloc/campaigns/campaigns_models.dart';
import '../../../theme/app_colors.dart';
import 'campaign_presentation_extensions.dart';

/// Renders the styled channel icon for a campaign.
class CampaignIcon extends StatelessWidget {
  final Campaign campaign;

  /// Creates a constant [CampaignIcon].
  const CampaignIcon({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    IconData iconData = Icons.call_rounded;
    if (campaign.type == CampaignType.whatsApp) {
      iconData = Icons.chat_bubble_rounded;
    } else if (campaign.type == CampaignType.email) {
      iconData = Icons.mail_rounded;
    }

    return Container(
      width: 40.w,
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(iconData, color: Colors.white, size: 20),
    );
  }
}
