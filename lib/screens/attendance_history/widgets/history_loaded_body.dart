import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_model.dart';
import 'history_calendar_day_detail.dart';
import 'history_calendar_view.dart';
import 'history_leaves_card.dart';
import 'history_log_view.dart';
import 'history_stats_row.dart';
import 'history_summary_card.dart';
import 'history_toggle_bar.dart';

class HistoryLoadedBody extends StatelessWidget {
  final AttendanceHistoryModel history;
  final String selectedTab;
  final int selectedDay;
  final ValueChanged<String> onTabChanged;
  final ValueChanged<int> onDayChanged;

  const HistoryLoadedBody({
    super.key,
    required this.history,
    required this.selectedTab,
    required this.selectedDay,
    required this.onTabChanged,
    required this.onDayChanged,
  });

  @override
  Widget build(BuildContext context) {
    final selectedLog = history.logs.firstWhere((l) => l.day == selectedDay);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          HistorySummaryCard(history: history),
          HistoryStatsRow(history: history),
          HistoryLeavesCard(history: history),
          const SizedBox(height: 8),
          HistoryToggleBar(selected: selectedTab, onChanged: onTabChanged),
          if (selectedTab == 'Calendar') ...[
            HistoryCalendarView(
              history: history,
              selectedDay: selectedDay,
              onDaySelected: onDayChanged,
            ),
            HistoryCalendarDayDetail(log: selectedLog),
          ] else
            HistoryLogView(history: history),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
