import 'package:flutter/material.dart';
import '../../../bloc/notifications/notifications_models.dart';
import '../../../theme/app_colors.dart';

/// Style configuration for a specific notification type.
class NotificationItemStyle {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  const NotificationItemStyle(this.icon, this.bgColor, this.iconColor);
}

/// Resolves style configurations for [NotificationType].
extension NotificationTypeStyle on NotificationType {
  NotificationItemStyle get style {
    switch (this) {
      case NotificationType.lead:
        return const NotificationItemStyle(
          Icons.people_outline_rounded,
          AppColors.primaryColorLight,
          AppColors.primaryColor,
        );
      case NotificationType.followUp:
        return const NotificationItemStyle(
          Icons.phone_in_talk_outlined,
          AppColors.successBackground,
          AppColors.success,
        );
      case NotificationType.task:
        return const NotificationItemStyle(
          Icons.check_box_outlined,
          AppColors.warningLight,
          AppColors.warningText,
        );
      case NotificationType.deal:
        return const NotificationItemStyle(
          Icons.business_center_outlined,
          AppColors.accentBackground,
          AppColors.accent,
        );
      case NotificationType.leadStatus:
        return const NotificationItemStyle(
          Icons.refresh_rounded,
          AppColors.infoBackground,
          AppColors.info,
        );
      case NotificationType.mention:
        return const NotificationItemStyle(
          Icons.description_outlined,
          AppColors.successLight,
          AppColors.successDark,
        );
    }
  }
}
