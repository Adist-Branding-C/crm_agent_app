import 'package:flutter/material.dart';
import '../../../data/models/my_activity/my_activity_enums.dart';
import '../../../theme.dart';
import 'activity_status_badge.dart';

/// Title row showing activity title and status badge.
class ActivityTitleRow extends StatelessWidget {
  final String title;
  final ActivityStatus status;

  const ActivityTitleRow({
    super.key,
    required this.title,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style:  TextStyle(
            fontSize: 14.s,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        AppSpacing.gapWSm,
        ActivityStatusBadge(status: status),
      ],
    );
  }
}
