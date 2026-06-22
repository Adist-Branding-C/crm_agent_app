import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/attendance_history/attendance_history_bloc.dart';
import '../../../widgets/app_error_widget.dart';
import '../../../widgets/app_loading_widget.dart';
import 'history_calendar_day_detail.dart';
import 'history_calendar_view.dart';
import 'history_leaves_card.dart';
import 'history_log_view.dart';
import 'history_stats_row.dart';
import 'history_summary_card.dart';
import 'history_toggle_bar.dart';

/// Coordinator widget managing loading, error status, tab switches, and layout.
class HistoryContent extends StatelessWidget {
  /// Creates a constant [HistoryContent].
  const HistoryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceHistoryBloc, AttendanceHistoryState>(
      builder: (context, state) {
        if (state is AttendanceHistoryLoading ||
            state is AttendanceHistoryInitial) {
          return const Center(child: AppLoadingWidget());
        }
        if (state is AttendanceHistoryLoaded) {
          return _buildLoadedBody(context, state);
        }
        final msg = state is AttendanceHistoryError ? state.message : 'Error';
        return AppErrorWidget(
          message: msg,
          onRetry: () => context
              .read<AttendanceHistoryBloc>()
              .add(const LoadAttendanceHistory()),
        );
      },
    );
  }

  Widget _buildLoadedBody(
    BuildContext context,
    AttendanceHistoryLoaded state,
  ) {
    final selectedTab = ValueNotifier<String>('Calendar');
    final selectedDay = ValueNotifier<int>(12);
    final history = state.history;

    return ValueListenableBuilder<String>(
      valueListenable: selectedTab,
      builder: (context, currentTab, _) {
        return ValueListenableBuilder<int>(
          valueListenable: selectedDay,
          builder: (context, currentDay, _) {
            final selectedLog =
                history.logs.firstWhere((l) => l.day == currentDay);
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  HistorySummaryCard(history: history),
                  HistoryStatsRow(history: history),
                  HistoryLeavesCard(history: history),
                  const SizedBox(height: 8),
                  HistoryToggleBar(
                    selected: currentTab,
                    onChanged: (val) => selectedTab.value = val,
                  ),
                  if (currentTab == 'Calendar') ...[
                    HistoryCalendarView(
                      history: history,
                      selectedDay: currentDay,
                      onDaySelected: (day) => selectedDay.value = day,
                    ),
                    HistoryCalendarDayDetail(log: selectedLog),
                  ] else
                    HistoryLogView(history: history),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
