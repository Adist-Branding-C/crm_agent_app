import 'package:flutter/material.dart';
import '../../theme.dart';
import 'widgets/attendance_content.dart';
import 'widgets/attendance_header.dart';

/// Screen displaying daily activity and attendance check-in/out.
class AttendanceScreen extends StatelessWidget {
  /// Creates a constant [AttendanceScreen].
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
    );
  }
}
