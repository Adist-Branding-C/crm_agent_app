import 'package:crm_agent_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import '../../bloc/attendance_history/attendance_history_bloc.dart';
import '../../data/repositories/attendance_repository.dart';
import '../../widgets/card_icon_button.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import 'widgets/history_content.dart';

/// Entry page widget for displaying attendance history and summaries.
class AttendanceHistoryScreen extends StatelessWidget {
  /// Creates a constant [AttendanceHistoryScreen].
  const AttendanceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = context.read<AttendanceRepository>();
    return BlocProvider(
      create: (_) =>
          AttendanceHistoryBloc(repository: repo)
            ..add(const LoadAttendanceHistory()),
      child: PageScaffold(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            ScreenHeader(
              title: 'Attendance History',
              subtitle: 'May 2026 • Calicut Branch',
              actions: CardIconButton(
                icon: Icons.calendar_today_outlined,
                onTap: () {},
                size: 30.s,
                iconSize: 16.s,
              ),
              padding: EdgeInsets.fromLTRB(17.0.w, 30.0.h, 17.0.w, 13.0.h),
            ),
            AppSpacing.gapMd,
            const Expanded(child: HistoryContent()),
          ],
        ),
      ),
    );
  }
}
