import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/attendance_history/attendance_history_bloc.dart';
import '../../../widgets/app_error_widget.dart';
import '../../../widgets/app_loading_widget.dart';
import 'history_loaded_body.dart';

class HistoryContent extends StatefulWidget {
  const HistoryContent({super.key});

  @override
  State<HistoryContent> createState() => _HistoryContentState();
}

class _HistoryContentState extends State<HistoryContent> {
  String _selectedTab = 'Calendar';
  int _selectedDay = 12;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceHistoryBloc, AttendanceHistoryState>(
      builder: (context, state) {
        if (state is AttendanceHistoryLoading ||
            state is AttendanceHistoryInitial) {
          return const Center(child: AppLoadingWidget());
        }
        if (state is AttendanceHistoryLoaded) {
          return HistoryLoadedBody(
            history: state.history,
            selectedTab: _selectedTab,
            selectedDay: _selectedDay,
            onTabChanged: (v) => setState(() => _selectedTab = v),
            onDayChanged: (v) => setState(() => _selectedDay = v),
          );
        }
        final msg = state is AttendanceHistoryError ? state.message : 'Error';
        return AppErrorWidget(
          message: msg,
          onRetry: () => context.read<AttendanceHistoryBloc>().add(
            const LoadAttendanceHistory(),
          ),
        );
      },
    );
  }
}
