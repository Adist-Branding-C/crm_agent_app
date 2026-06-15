import 'package:flutter/material.dart';
import '../../../widgets/screen_header.dart';

/// The top header for the Attendance screen, containing back action and date.
class AttendanceHeader extends StatelessWidget {
  /// Creates a constant [AttendanceHeader].
  const AttendanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenHeader(
      title: 'Daily Activity',
      subtitle: 'Tuesday, 12 May',
      showBackButton: true,
      padding: EdgeInsets.zero,
    );
  }
}
