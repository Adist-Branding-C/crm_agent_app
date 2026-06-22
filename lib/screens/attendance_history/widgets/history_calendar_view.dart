import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_model.dart';
import '../../../widgets/custom_card.dart';
import 'calendar_grid.dart';
import 'calendar_header.dart';
import 'history_calendar_legend.dart';
import 'week_days_header.dart';

class HistoryCalendarView extends StatelessWidget {
  final AttendanceHistoryModel history;
  final int selectedDay;
  final ValueChanged<int> onDaySelected;

  const HistoryCalendarView({
    super.key,
    required this.history,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CalendarHeader(),
          const SizedBox(height: 16),
          const WeekDaysHeader(),
          const SizedBox(height: 8),
          CalendarGrid(history: history, selectedDay: selectedDay, onDaySelected: onDaySelected),
          const HistoryCalendarLegend(),
        ],
      ),
    );
  }
}
