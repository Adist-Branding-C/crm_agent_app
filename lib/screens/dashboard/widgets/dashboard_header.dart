import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/attendance/attendance_bloc.dart';
import '../../../theme.dart';
import '../../../widgets/screen_header.dart';
import 'header_actions.dart';

/// Renders the composed top header section of the Dashboard.
class DashboardHeader extends StatelessWidget {
  /// Creates a constant [DashboardHeader].
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHeader(
      title: 'Dashboard',
      showBackButton: false,
      subtitleWidget: BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (context, state) {
          final statusText = state is AttendanceLoaded && state.isCheckedIn
              ? 'Checked in • ${state.checkInTime ?? '—'}'
              : 'Checked out';
          return Row(
            children: [
              const Icon(Icons.circle, size: 8, color: AppColors.success),
              const SizedBox(width: 6),
              Text(
                statusText,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          );
        },
      ),
      actions: const HeaderActions(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    );
  }
}
