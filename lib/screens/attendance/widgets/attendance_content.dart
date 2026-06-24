import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/attendance/attendance_bloc.dart';
import '../../../theme.dart';
import '../../../utils/responsive_helper.dart';
import '../../../widgets/app_error_widget.dart';
import '../../../widgets/app_loading_widget.dart';
import 'check_in_card.dart';
import 'stats_row.dart';
import 'timeline_list.dart';

String _attendanceErrorString(AttendanceFailure f) {
  switch (f) {
    case AttendanceFailure.load: return 'Failed to load attendance';
    case AttendanceFailure.unknown: return 'An error occurred';
  }
}

/// Content display block for the Attendance Screen.
class AttendanceContent extends StatelessWidget {
  /// Creates a constant [AttendanceContent].
  const AttendanceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
      builder: (context, state) {
        if (state is AttendanceLoading || state is AttendanceInitial) {
          return const Padding(
            padding: EdgeInsets.only(top: AppSpacing.hundred),
            child: AppLoadingWidget(),
          );
        }
        if (state is AttendanceLoaded) {
          final leftCol = [
            CheckInCard(
              isCheckedIn: state.isCheckedIn,
              checkInTime: state.checkInTime,
              location: state.location,
            ),
            AppSpacing.gapXl,
            StatsRow(
              callsCount: state.callsCount,
              visitsCount: state.visitsCount,
              notesCount: state.notesCount,
              hoursCount: state.hoursCount,
            ),
          ];

          if (ResponsiveHelper.isTablet(context)) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Column(children: leftCol)),
                AppSpacing.gapWXxl,
                Expanded(child: TimelineList(items: state.timeline)),
              ],
            );
          }

          return Column(
            children: [
              ...leftCol,
              AppSpacing.gapXxl,
              TimelineList(items: state.timeline),
            ],
          );
        }
        final msg = state is AttendanceError ? _attendanceErrorString(state.failure) : 'Error';
        return AppErrorWidget(
          message: msg,
          onRetry: () =>
              context.read<AttendanceBloc>().add(const LoadAttendance()),
        );
      },
    );
  }
}
