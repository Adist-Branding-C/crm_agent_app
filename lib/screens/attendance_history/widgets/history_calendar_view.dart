import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_model.dart';
import '../../../theme.dart';
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
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.sm),
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CalendarHeader(),
          AppSpacing.gapLg,
          const WeekDaysHeader(),
          AppSpacing.gapSm,
          CalendarGrid(history: history, selectedDay: selectedDay, onDaySelected: onDaySelected),
          const HistoryCalendarLegend(),
        ],
      ),
    );
  }
}
