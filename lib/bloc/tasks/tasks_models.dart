import 'package:equatable/equatable.dart';
import 'task_type.dart';
export 'task_type.dart';

/// Priority of task item.
enum TaskPriority {
  high,
  medium,
  low;
}

/// Represents a single task item.
class Task extends Equatable {
  final String id;
  final String title;
  final TaskType type;
  final String time;
  final bool isCompleted;
  final bool isOverdue;
  final TaskPriority priority;
  final String? description;
  final DateTime? dueDate;

  /// Creates a constant [Task].
  const Task({
    this.id = '',
    required this.title,
    required this.type,
    required this.time,
    required this.isCompleted,
    required this.isOverdue,
    required this.priority,
    this.description,
    this.dueDate,
  });

  /// Copy constructor.
  Task copyWith({
    String? id,
    String? title,
    TaskType? type,
    String? time,
    bool? isCompleted,
    bool? isOverdue,
    TaskPriority? priority,
    String? description,
    DateTime? dueDate,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      time: time ?? this.time,
      isCompleted: isCompleted ?? this.isCompleted,
      isOverdue: isOverdue ?? this.isOverdue,
      priority: priority ?? this.priority,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        type,
        time,
        isCompleted,
        isOverdue,
        priority,
        description,
        dueDate,
      ];
}
