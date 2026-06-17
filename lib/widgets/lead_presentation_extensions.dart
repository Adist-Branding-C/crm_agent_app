import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../bloc/leads/leads_enums.dart';

class ChipConfig {
  final Color bgColor;
  final Color textColor;
  const ChipConfig(this.bgColor, this.textColor);
}

extension LeadStatusColors on LeadStatus {
  Color get barColor {
    return switch (this) {
      LeadStatus.newStatus => AppColors.info,
      LeadStatus.interested => AppColors.success,
      LeadStatus.qualified => AppColors.accent,
      LeadStatus.followUp => AppColors.warning,
      LeadStatus.notInterested => AppColors.errorColor,
      LeadStatus.converted => AppColors.success,
      LeadStatus.lost => AppColors.errorColor,
    };
  }

  ChipConfig get chipConfig {
    return switch (this) {
      LeadStatus.newStatus => const ChipConfig(AppColors.infoBackground, AppColors.infoDark),
      LeadStatus.interested => const ChipConfig(AppColors.successBackground, AppColors.success),
      LeadStatus.qualified => const ChipConfig(AppColors.accentBackground, AppColors.accent),
      LeadStatus.followUp => const ChipConfig(AppColors.warningLight, AppColors.warningDark),
      LeadStatus.notInterested => const ChipConfig(AppColors.slate50, AppColors.slate500),
      LeadStatus.converted => const ChipConfig(AppColors.successLight, AppColors.successDark),
      LeadStatus.lost => const ChipConfig(AppColors.slate50, AppColors.slate600),
    };
  }
}

extension LeadSourceColors on LeadSource {
  Color get barColor {
    return switch (this) {
      LeadSource.facebook => AppColors.info,
      LeadSource.website => AppColors.success,
      LeadSource.referral => AppColors.accent,
      LeadSource.instagram => AppColors.warning,
      LeadSource.walkIn => AppColors.infoDark,
      LeadSource.googleAds => AppColors.errorColor,
    };
  }
}
