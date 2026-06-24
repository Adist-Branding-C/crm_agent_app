import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../theme.dart';

/// Returns a color palette configuration based on the Lead Status.
List<Color> getStatusColors(LeadStatus status) {
  if (status == LeadStatus.interested ||
      status == LeadStatus.converted ||
      status == LeadStatus.qualified) {
    return [
      AppColors.success,
      AppColors.successBackground,
      AppColors.successAlpha15,
    ];
  }
  if (status == LeadStatus.notInterested || status == LeadStatus.lost) {
    return [
      AppColors.errorColor,
      AppColors.errorBackground,
      AppColors.errorBorder,
    ];
  }
  return [
    AppColors.infoText,
    AppColors.infoBackgroundLight,
    AppColors.infoAlpha15,
  ];
}

/// Returns a color palette configuration based on the Lead Purpose.
List<Color> getPurposeColors(LeadPurpose purpose) {
  if (purpose == LeadPurpose.newAdmission) {
    return [
      AppColors.primaryColor,
      AppColors.primaryColorLight,
      AppColors.primaryAlpha30,
    ];
  }
  if (purpose == LeadPurpose.enquiry) {
    return [
      AppColors.infoText,
      AppColors.infoBackgroundLight,
      AppColors.infoAlpha15,
    ];
  }
  return [
    AppColors.warningText,
    AppColors.warningTextBackground,
    AppColors.warningAlpha15,
  ];
}
