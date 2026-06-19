import 'package:equatable/equatable.dart';
import 'my_activity_enums.dart';

/// Represents a single activity event on the My Activity page.
class MyActivityItem extends Equatable {
  final String id;
  final String title;
  final String description;
  final ActivityStatus status;
  final ActivityTypeFilter entityType;
  final String assignee;
  final String time;
  final String dateLabel;

  const MyActivityItem({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.entityType,
    required this.assignee,
    required this.time,
    required this.dateLabel,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        status,
        entityType,
        assignee,
        time,
        dateLabel,
      ];
}

/// Grouped activities under a date label.
class ActivityDateGroup extends Equatable {
  final String dateLabel;
  final List<MyActivityItem> items;

  const ActivityDateGroup({
    required this.dateLabel,
    required this.items,
  });

  @override
  List<Object?> get props => [dateLabel, items];
}
