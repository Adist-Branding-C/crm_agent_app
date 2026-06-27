import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import '../../../widgets/screen_header.dart';

class AttendanceHeader extends StatelessWidget {
  const AttendanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenHeader(
      title: 'Daily Activity',
      subtitle: 'Tuesday, 12 May',
      showBackButton: true,
      padding:EdgeInsets.fromLTRB(
      0,
      35.0.h,
      17.0.w,
      0
    )
    );
  }
}
