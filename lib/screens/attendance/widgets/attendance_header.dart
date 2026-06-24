import 'package:flutter/material.dart';
import '../../../widgets/screen_header.dart';

class AttendanceHeader extends StatelessWidget {
  const AttendanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenHeader(
      title: 'Daily Activity',
      subtitle: 'Tuesday, 12 May',
      showBackButton: true,
    );
  }
}
