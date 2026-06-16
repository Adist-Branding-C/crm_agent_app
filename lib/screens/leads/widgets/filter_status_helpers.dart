import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../theme/app_colors.dart';

/// Configuration for styling status chips.
class ChipConfig {
  /// Background color of the chip.
  final Color bgColor;

  /// Text and border color of the chip.
  final Color textColor;

  /// Creates a constant [ChipConfig].
  const ChipConfig(this.bgColor, this.textColor);
}

/// Resolves the styling configuration for a given lead status.
ChipConfig getChipConfig(LeadStatus status) {
  switch (status) {
    case LeadStatus.newStatus:
      return const ChipConfig(AppColors.infoBackground, AppColors.infoDark);
    case LeadStatus.interested:
      return const ChipConfig(AppColors.successBackground, AppColors.success);
    case LeadStatus.qualified:
      return const ChipConfig(AppColors.accentBackground, AppColors.accent);
    case LeadStatus.followUp:
      return const ChipConfig(AppColors.warningLight, AppColors.warningDark);
    case LeadStatus.notInterested:
      return const ChipConfig(AppColors.slate50, AppColors.slate500); // Wait! Let's check slate5 vs slate50. Let's see: AppColors has slate50, not slate5.
    case LeadStatus.converted:
      return const ChipConfig(AppColors.successLight, AppColors.successDark);
    default:
      return const ChipConfig(AppColors.slate50, AppColors.slate600);
  }
}
