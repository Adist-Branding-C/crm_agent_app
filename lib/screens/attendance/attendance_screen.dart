import 'package:flutter/material.dart';
import '../../theme.dart';
import 'widgets/attendance_content.dart';
import 'widgets/attendance_header.dart';



class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: AppSpacing.screenPaddingV,
            child: Column(
              children: [
                AttendanceHeader(),
                SizedBox(height: AppSpacing.xxl),
                AttendanceContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
