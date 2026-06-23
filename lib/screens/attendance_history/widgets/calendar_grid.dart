import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_log_model.dart';
import '../../../data/models/attendance_history_model.dart';
import 'history_calendar_day_cell.dart';

class CalendarGrid extends StatelessWidget {
  final AttendanceHistoryModel history;
  final int selectedDay;
  final ValueChanged<int> onDaySelected;

  const CalendarGrid({
    super.key,
    required this.history,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final list = <Widget>[];
    for (var i = 0; i < 5; i++) {
      list.add(const SizedBox.shrink());
    }
    for (var d = 1; d <= 31; d++) {
      final log = history.logs.firstWhere(
        (l) => l.day == d,
        orElse: () => AttendanceHistoryLogModel(day: d, dayName: '', status: ''),
      );
      list.add(HistoryCalendarDayCell(
        day: d,
        log: log,
        isSelected: selectedDay == d,
        onTap: log.dayName.isNotEmpty ? () => onDaySelected(d) : null,
      ));
    }
    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 8,
      crossAxisSpacing: 6,
      childAspectRatio: 1.0,
      children: list,
    );
  }
}
