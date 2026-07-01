import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_log_model.dart';
import '../../../theme.dart';
import 'history_detail_box.dart';

/// Inside content showing timing metrics for a selected working day.
class HistoryCalendarWorkingDayDetail extends StatelessWidget {
  /// Selected day log details.
  final AttendanceHistoryLogModel log;

  /// Creates a [HistoryCalendarWorkingDayDetail].
  const HistoryCalendarWorkingDayDetail({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            HistoryDetailBox(
              icon: Icons.login_rounded,
              val: log.checkInTime ?? '—',
              label: 'Check in',
              color: AppColors.success,
            ),
            AppSpacing.gapWSm,
            HistoryDetailBox(
              icon: Icons.logout_rounded,
              val: log.checkOutTime ?? '—',
              label: 'Check out',
              color: AppColors.errorColor,
            ),
            AppSpacing.gapWSm,
            HistoryDetailBox(
              icon: Icons.access_time_rounded,
              val: log.hours ?? '—',
              label: 'Hours',
              color: AppColors.info,
            ),
          ],
        ),
        AppSpacing.gapMd,
        Row(
          children: [
             Icon(
              Icons.location_on_outlined,
              color: AppColors.textMuted,
              size: 12.s,
            ),
            AppSpacing.gapWXs,
            Expanded(
              child: Text(
                log.location ?? '—',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.textMuted,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (log.isGpsVerified) ...[
              AppSpacing.gapWMd,
               Icon(
                Icons.verified_user_outlined,
                color: AppColors.success,
                size: 12.s,
              ),
              AppSpacing.gapWXs,
              Text(
                'GPS verified',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.success,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
