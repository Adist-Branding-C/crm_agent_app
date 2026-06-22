import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_model.dart';
import '../../../data/models/attendance_history_log_model.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import 'history_calendar_day_cell.dart';
import 'history_calendar_legend.dart';

/// Calendar widget wrapping dates grid and legends in a custom card container.
class HistoryCalendarView extends StatelessWidget {
  /// History summary data.
  final AttendanceHistoryModel history;

  /// Selected calendar day value.
  final int selectedDay;

  /// Trigger callback when a day cell is clicked.
  final ValueChanged<int> onDaySelected;

  /// Creates a [HistoryCalendarView].
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
          _buildHeader(),
          const SizedBox(height: 16),
          _buildWeekDays(),
          const SizedBox(height: 8),
          _buildGrid(),
          const HistoryCalendarLegend(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('May 2026', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textDark)),
        Text('Through 12 May', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
      ],
    );
  }

  Widget _buildWeekDays() {
    const days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.map((d) => SizedBox(
        width: 32,
        child: Align(
          alignment: Alignment.center,
          child: Text(d, style: const TextStyle(color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.w500)),
        ),
      )).toList(),
    );
  }

  Widget _buildGrid() {
    final list = <Widget>[];
    for (var i = 0; i < 5; i++) {
      list.add(const SizedBox(width: 36, height: 36));
    }
    for (var d = 1; d <= 31; d++) {
      final log = history.logs.firstWhere((l) => l.day == d,
          orElse: () => AttendanceHistoryLogModel(day: d, dayName: '', status: ''));
      list.add(HistoryCalendarDayCell(
        day: d,
        log: log,
        isSelected: selectedDay == d,
        onTap: log.dayName.isNotEmpty ? () => onDaySelected(d) : null,
      ));
    }
    return Wrap(spacing: 6, runSpacing: 8, children: list);
  }
}
