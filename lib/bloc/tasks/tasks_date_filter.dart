import 'tasks_filter_criteria.dart';

/// Extension defining date range queries for [DateRangeType].
extension DateRangeTypeFilter on DateRangeType {
  /// Evaluates whether a target date matches the selected range.
  bool matches(
    DateTime tDate,
    DateTime today, {
    DateTime? from,
    DateTime? to,
  }) {
    switch (this) {
      case DateRangeType.today:
        return tDate == today;
      case DateRangeType.tomorrow:
        return tDate == today.add(const Duration(days: 1));
      case DateRangeType.lastWeek:
        final sevenDaysAgo = today.subtract(const Duration(days: 7));
        return tDate.isAfter(
              sevenDaysAgo.subtract(const Duration(seconds: 1)),
            ) &&
            tDate.isBefore(today.add(const Duration(days: 1)));
      case DateRangeType.custom:
        if (from == null || to == null) return true;
        final fDate = DateTime(from.year, from.month, from.day);
        final oDate = DateTime(to.year, to.month, to.day);
        return tDate.isAfter(fDate.subtract(const Duration(seconds: 1))) &&
            tDate.isBefore(oDate.add(const Duration(days: 1)));
      default:
        return true;
    }
  }
}
