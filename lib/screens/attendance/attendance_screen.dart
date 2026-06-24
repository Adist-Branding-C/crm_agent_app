import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/attendance_content.dart';
import 'widgets/attendance_header.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            AttendanceHeader(),
            SizedBox(height: AppSpacing.xxl),
            AttendanceContent(),
          ],
        ),
      ),
    );
  }
}
