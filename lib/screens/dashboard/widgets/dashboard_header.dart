import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/attendance/attendance_bloc.dart';
import '../../../theme.dart';
import '../../../widgets/screen_header.dart';
import 'header_actions.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHeader(
      title: 'Dashboard',
      showBackButton: false,
      subtitleWidget: BlocBuilder<AttendanceBloc, AttendanceState>(
        buildWhen: (prev, curr) {
          if (prev is AttendanceLoaded && curr is AttendanceLoaded) {
            return prev.isCheckedIn != curr.isCheckedIn ||
                prev.checkInTime != curr.checkInTime;
          }
          return prev.runtimeType != curr.runtimeType;
        },
        builder: (context, state) {
          final isCheckedIn = state is AttendanceLoaded && state.isCheckedIn;
          final statusText = isCheckedIn
              ? 'Checked in • ${state.checkInTime ?? '—'}'
              : 'Checked out';
          return Row(
            children: [
              Icon(
                Icons.circle,
                size: 8.s,
                color: isCheckedIn ? AppColors.success : AppColors.textMuted,
              ),
              SizedBox(width: AppSpacing.xs2),
              Expanded(
                child: Text(
                  statusText,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isCheckedIn
                        ? AppColors.success
                        : AppColors.textMuted,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
      ),
      actions: const HeaderActions(),
      padding: AppSpacing.headerPadding,
    );
  }
}
