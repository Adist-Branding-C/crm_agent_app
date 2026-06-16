import '../../../theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../bloc/enquiry_details/enquiry_details_models.dart';
import '../../../widgets/timeline_tile_config.dart';

/// Mapping of enquiry activity types to their timeline tile configurations.
const activitiesConfigs = {
  EnquiryActivityType.call: TimelineTileConfig(
    icon: Icons.phone,
    iconColor: AppColors.success,
    bgColor: AppColors.successBackground,
  ),
  EnquiryActivityType.statusChange: TimelineTileConfig(
    icon: Icons.sync,
    iconColor: AppColors.accent,
    bgColor: AppColors.accentBackground,
  ),
  EnquiryActivityType.note: TimelineTileConfig(
    icon: Icons.description,
    iconColor: AppColors.info,
    bgColor: AppColors.infoBackground,
  ),
  EnquiryActivityType.task: TimelineTileConfig(
    icon: Icons.check_box,
    iconColor: AppColors.warning,
    bgColor: AppColors.warningBackground,
  ),
  EnquiryActivityType.system: TimelineTileConfig(
    icon: Icons.person,
    iconColor: AppColors.errorColor,
    bgColor: AppColors.errorBackground,
  ),
};
