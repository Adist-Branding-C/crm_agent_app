import '../../bloc/tasks/tasks_models.dart';

/// Generates mock tasks with dynamic DateTimes relative to current local time.
List<Task> createMockTasks() {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  return [
    Task(
      id: '1',
      title: 'Prepare project proposal',
      type: TaskType.task,
      time: 'Today, 5:30 PM',
      isCompleted: false,
      isOverdue: false,
      priority: TaskPriority.high,
      dueDate: today.add(const Duration(hours: 17, minutes: 30)),
    ),
    Task(
      id: '2',
      title: 'Campus visit — Aravind Krishnan',
      type: TaskType.meeting,
      time: 'Today, 6:00 PM',
      isCompleted: false,
      isOverdue: false,
      priority: TaskPriority.medium,
      dueDate: today.add(const Duration(hours: 18)),
    ),
    Task(
      id: '3',
      title: 'Collect documents — Vishnu Prasad',
      type: TaskType.task,
      time: 'Today, 7:00 PM',
      isCompleted: false,
      isOverdue: false,
      priority: TaskPriority.high,
      dueDate: today.add(const Duration(hours: 19)),
    ),
    Task(
      id: '4',
      title: 'Confirm batch slot — Lakshmi Warrier',
      type: TaskType.call,
      time: 'Today, 2:30 PM OVERDUE',
      isCompleted: false,
      isOverdue: true,
      priority: TaskPriority.high,
      dueDate: today.add(const Duration(hours: 14, minutes: 30)),
    ),
    Task(
      id: '5',
      title: 'Demo reminder — Divya Raveendran',
      type: TaskType.call,
      time: 'Yesterday, 11:00 AM OVERDUE',
      isCompleted: false,
      isOverdue: true,
      priority: TaskPriority.medium,
      dueDate:
          today.subtract(const Duration(days: 1)).add(const Duration(hours: 11)),
    ),
    Task(
      id: '6',
      title: 'Deal paperwork — Enterprise batch',
      type: TaskType.deal,
      time: 'Tomorrow, 10:00 AM',
      isCompleted: false,
      isOverdue: false,
      priority: TaskPriority.medium,
      dueDate: today.add(const Duration(days: 1, hours: 10)),
    ),
    Task(
      id: '7',
      title: 'Welcome call — new admission',
      type: TaskType.call,
      time: 'Yesterday, 9:00 AM',
      isCompleted: true,
      isOverdue: false,
      priority: TaskPriority.low,
      dueDate:
          today.subtract(const Duration(days: 1)).add(const Duration(hours: 9)),
    ),
    Task(
      id: '8',
      title: 'Quarterly review prep',
      type: TaskType.task,
      time: '2 days ago',
      isCompleted: true,
      isOverdue: false,
      priority: TaskPriority.low,
      dueDate: today.subtract(const Duration(days: 2)),
    ),
  ];
}
