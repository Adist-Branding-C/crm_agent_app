import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/attendance/attendance_bloc.dart';
import '../../data/repositories/attendance_repository.dart';
import '../../theme.dart';
import 'widgets/attendance_content.dart';
import 'widgets/attendance_header.dart';

/// Screen displaying daily activity and attendance check-in/out.
class AttendanceScreen extends StatelessWidget {
  /// Creates a constant [AttendanceScreen].
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttendanceBloc(
        attendanceRepository: context.read<AttendanceRepository>(),
      )..add(const LoadAttendance()),
      child: const Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  AttendanceHeader(),
                  SizedBox(height: 24),
                  AttendanceContent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
