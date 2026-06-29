import 'package:flutter/material.dart';
import '../../../../utils/date_picker_helper.dart';

/// Helper utilities for formatting and picking dates/times in Add Task.
class AddTaskDatePickerHelper {
  AddTaskDatePickerHelper._();

  /// Prompts the user with Date and Time pickers sequentially.
  static Future<DateTime?> pickDateTime(BuildContext context) =>
      DatePickerHelper.pickDateTime(context);

  /// Formats the given [dt] to a user-friendly String like "Today, 5:00 PM".
  static String format(DateTime dt) => DatePickerHelper.format(dt);
}
