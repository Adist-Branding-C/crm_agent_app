import 'package:flutter/material.dart';

/// Helper utilities for formatting and picking dates/times in Add Task.
class AddTaskDatePickerHelper {
  AddTaskDatePickerHelper._();

  /// Prompts the user with Date and Time pickers sequentially.
  static Future<DateTime?> pickDateTime(BuildContext context) async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now.subtract(const Duration(days: 365)),
      lastDate: now.add(const Duration(days: 365 * 5)),
    );
    if (date == null) return null;

    if (!context.mounted) return null;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(now),
    );
    if (time == null) return null;

    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  /// Formats the given [dt] to a user-friendly String like "Today, 5:00 PM".
  static String format(DateTime dt) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final compareDate = DateTime(dt.year, dt.month, dt.day);

    final hour = dt.hour > 12 ? dt.hour - 12 : (dt.hour == 0 ? 12 : dt.hour);
    final ampm = dt.hour >= 12 ? 'PM' : 'AM';
    final minute = dt.minute.toString().padLeft(2, '0');
    final timeStr = '$hour:$minute $ampm';

    if (compareDate == today) return 'Today, $timeStr';
    if (compareDate == tomorrow) return 'Tomorrow, $timeStr';
    final m = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${m[dt.month - 1]} ${dt.day}, ${dt.year}, $timeStr';
  }
}
