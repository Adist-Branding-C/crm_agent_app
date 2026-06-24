import '../../data/models/my_activity/my_activity_model.dart';
import '../../data/models/my_activity/my_activity_enums.dart';

/// Applies time, type, and lead filters to activity items.
List<MyActivityItem> applyActivityFilters(
  List<MyActivityItem> items, {
  required ActivityTimeFilter timeFilter,
  required ActivityTypeFilter typeFilter,
  required String leadFilter,
}) {
  var filtered = items;
  if (typeFilter != ActivityTypeFilter.all) {
    filtered = filtered.where((i) => i.entityType == typeFilter).toList();
  }
  if (leadFilter != 'All leads') {
    filtered = filtered.where((i) => i.assignee == leadFilter).toList();
  }
  filtered = _applyTimeFilter(filtered, timeFilter);
  return filtered;
}

List<MyActivityItem> _applyTimeFilter(
  List<MyActivityItem> items,
  ActivityTimeFilter filter,
) {
  final now = DateTime(2026, 5, 12);
  if (filter == ActivityTimeFilter.all) return items;
  if (filter == ActivityTimeFilter.today) {
    return items.where((i) => i.dateLabel == 'May 12, 2026').toList();
  }
  if (filter == ActivityTimeFilter.yesterday) {
    return items.where((i) => i.dateLabel == 'May 11, 2026').toList();
  }
  return items.where((i) {
    final date = _parseDate(i.dateLabel);
    return date != null && now.difference(date).inDays < 7;
  }).toList();
}

DateTime? _parseDate(String label) {
  final months = {
    'January': 1,
    'February': 2,
    'March': 3,
    'April': 4,
    'May': 5,
    'June': 6,
    'July': 7,
    'August': 8,
    'September': 9,
    'October': 10,
    'November': 11,
    'December': 12,
  };
  final parts = label.split(' ');
  if (parts.length != 3) return null;
  final month = months[parts[0]];
  final day = int.tryParse(parts[1].replaceAll(',', ''));
  final year = int.tryParse(parts[2]);
  if (month == null || day == null || year == null) return null;
  return DateTime(year, month, day);
}

/// Groups activity items by their date label.
List<ActivityDateGroup> groupByDate(List<MyActivityItem> items) {
  final map = <String, List<MyActivityItem>>{};
  for (final item in items) {
    map.putIfAbsent(item.dateLabel, () => []).add(item);
  }
  return map.entries
      .map((e) => ActivityDateGroup(dateLabel: e.key, items: e.value))
      .toList();
}
