import 'package:flutter/material.dart';
import '../../../../utils/date_picker_helper.dart';

/// Helper utilities for formatting and picking dates/times in Add Deal.
class AddDealDatePickerHelper {
  AddDealDatePickerHelper._();

  /// Prompts the user with Date and Time pickers sequentially.
  static Future<DateTime?> pickDateTime(BuildContext context) =>
      DatePickerHelper.pickDateTime(context);

  /// Formats the given [dt] to a user-friendly String like "Today, 4:00 PM".
  static String format(DateTime dt) => DatePickerHelper.format(dt);

  /// Formats date for deal closeDate (e.g. "Close May 12").
  static String formatCloseDate(DateTime dt) {
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
      'Dec',
    ];
    return 'Close ${m[dt.month - 1]} ${dt.day}';
  }
}
