import 'package:flutter/material.dart';
import '../../../data/models/my_activity/my_activity_enums.dart';
import '../../../theme.dart';

/// Colored badge displaying the activity status label.
class ActivityStatusBadge extends StatelessWidget {
  final ActivityStatus status;

  const ActivityStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final colors = _getColors();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status.label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: colors.text,
        ),
      ),
    );
  }

  ({Color background, Color text}) _getColors() {
    switch (status) {
      case ActivityStatus.done:
        return (background: AppColors.successBackground, text: AppColors.success);
      case ActivityStatus.deleted:
        return (background: AppColors.errorBackground, text: AppColors.errorColor);
      case ActivityStatus.edited:
        return (background: AppColors.warningTextBackground, text: AppColors.warningText);
      case ActivityStatus.assigned:
        return (background: AppColors.infoBackground, text: AppColors.infoText);
      case ActivityStatus.created:
        return (background: AppColors.successBackground, text: AppColors.success);
      case ActivityStatus.call:
        return (background: AppColors.successBackground, text: AppColors.success);
      case ActivityStatus.won:
        return (background: AppColors.successBackground, text: AppColors.success);
      case ActivityStatus.statusChange:
        return (background: AppColors.infoBackground, text: AppColors.infoText);
      case ActivityStatus.note:
        return (background: AppColors.warningTextBackground, text: AppColors.warningText);
    }
  }
}
