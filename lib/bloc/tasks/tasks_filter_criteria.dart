import 'package:equatable/equatable.dart';
import 'tasks_models.dart';

/// Preset date range options for task filtering.
enum DateRangeType {
  today('Today'),
  tomorrow('Tomorrow'),
  lastWeek('Last Week'),
  custom('Custom'),
  none('None');

  final String label;
  const DateRangeType(this.label);
}

/// Represents the selection criteria for filtering tasks.
class TaskFilterCriteria extends Equatable {
  final Set<TaskType> types;
  final DateRangeType dateRange;
  final DateTime? customFrom;
  final DateTime? customTo;
  final Set<TaskPriority> priorities;

  /// Creates a constant [TaskFilterCriteria].
  const TaskFilterCriteria({
    this.types = const {},
    this.dateRange = DateRangeType.none,
    this.customFrom,
    this.customTo,
    this.priorities = const {},
  });

  /// Returns true if no filter values are active.
  bool get isEmpty =>
      types.isEmpty && dateRange == DateRangeType.none && priorities.isEmpty;

  @override
  List<Object?> get props =>
      [types, dateRange, customFrom, customTo, priorities];
}
