import '../../../bloc/tasks/tasks_models.dart';

/// Extension for priority label formatting.
extension TaskPriorityExtension on TaskPriority {
  /// Returns the user-facing label for this priority.
  String get label => switch (this) {
        TaskPriority.high => 'High',
        TaskPriority.medium => 'Medium',
        TaskPriority.low => 'Low',
      };
}
