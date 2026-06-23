import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/attendance/attendance_bloc.dart';
import '../../theme.dart';
import 'widgets/attendance_content.dart';
import 'widgets/attendance_header.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AttendanceBloc(
        attendanceRepository: context.read(),
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
