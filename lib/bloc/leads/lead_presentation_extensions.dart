import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'leads_enums.dart';

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
