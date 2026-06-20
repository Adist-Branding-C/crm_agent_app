import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../bloc/leads/leads_enums.dart';

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
