import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/attendance/attendance_bloc.dart';
import '../../theme.dart';
import 'widgets/attendance_header.dart';
import 'widgets/check_in_card.dart';
import 'widgets/stats_row.dart';
import 'widgets/timeline_list.dart';

/// Screen displaying daily activity and attendance check-in/out.
class AttendanceScreen extends StatelessWidget {
  /// Creates a constant [AttendanceScreen].
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttendanceBloc()..add(const LoadAttendance()),
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: const SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  AttendanceHeader(),
                  SizedBox(height: 24),
                  _AttendanceContent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AttendanceContent extends StatelessWidget {
  const _AttendanceContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        if (state is AttendanceLoading || state is AttendanceInitial) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }
        if (state is AttendanceLoaded) {
          return Column(
            children: [
              CheckInCard(
                isCheckedIn: state.isCheckedIn,
                checkInTime: state.checkInTime,
                location: state.location,
              ),
              const SizedBox(height: 20),
              StatsRow(
                callsCount: state.callsCount,
                visitsCount: state.visitsCount,
                notesCount: state.notesCount,
                hoursCount: state.hoursCount,
              ),
              const SizedBox(height: 24),
              TimelineList(items: state.timeline),
            ],
          );
        }
        final msg = state is AttendanceError ? state.errorMessage : 'Error';
        return Center(
          child: Text(msg, style: const TextStyle(color: AppColors.errorColor)),
        );
      },
    );
  }
}
