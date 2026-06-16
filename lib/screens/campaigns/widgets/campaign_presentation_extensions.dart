import 'package:flutter/material.dart';
import '../../../bloc/campaigns/campaigns_models.dart';
import '../../../theme.dart';

/// Extension providing presentation configurations for the [Campaign] model.
extension CampaignPresentationExtensions on Campaign {
  /// Theme color associated with the campaign type/completion.
  Color get themeColor {
    if (isCompleted) return AppColors.success;
    switch (type) {
      case CampaignType.call:
        return AppColors.errorColor;
      case CampaignType.whatsApp:
        return AppColors.accent;
      case CampaignType.email:
        return AppColors.info;
    }
  }
}
