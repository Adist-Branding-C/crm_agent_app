import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/attendance_content.dart';
import 'widgets/attendance_header.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const AttendanceHeader(),
            SizedBox(height: AppSpacing.xxl),
            const AttendanceContent(),
          ],
        ),
      ),
    );
  }
}
