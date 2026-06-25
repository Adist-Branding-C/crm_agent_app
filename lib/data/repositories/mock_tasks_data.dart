import '../models/task_models.dart';

Task _t(String id, String title, TaskType type, String time, bool done, bool overdue, TaskPriority pri, DateTime due, [String? desc]) => Task(
      id: id, title: title, type: type, time: time, isCompleted: done, isOverdue: overdue, priority: pri, dueDate: due, description: desc,
    );

/// Generates mock tasks data matching the screenshots.
List<Task> createMockTasks() {
  final t = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  return [
    _t('1', 'Follow-up call — Rahul Menon', TaskType.call, 'Today, 4:00 PM', false, false, TaskPriority.high, t.add(const Duration(hours: 16)), 'Discuss premium course demo and pricing.'),
    _t('2', 'Send pricing sheet — Sneha Pillai', TaskType.task, 'Today, 5:30 PM', false, false, TaskPriority.high, t.add(const Duration(hours: 17, minutes: 30)), 'Send updated pricing sheet with discount options.'),
    _t('3', 'Campus visit — Aravind Krishnan', TaskType.meeting, 'Today, 6:00 PM', false, false, TaskPriority.medium, t.add(const Duration(hours: 18)), 'Show campus labs and classroom facilities.'),
    _t('4', 'Collect documents — Anjali Suresh', TaskType.task, 'Today, 7:00 PM', false, false, TaskPriority.high, t.add(const Duration(hours: 19)), 'Collect ID proof and academic transcripts.'),
    _t('5', 'Confirm batch slot — Lakshmi Warrier', TaskType.call, 'Today, 2:30 PM OVERDUE', false, true, TaskPriority.high, t.add(const Duration(hours: 14, minutes: 30)), 'Call to confirm preference for weekend batch slot.'),
    _t('6', 'Demo reminder — Divya Raveendran', TaskType.call, 'Yesterday, 11:00 AM OVERDUE', false, true, TaskPriority.medium, t.subtract(const Duration(days: 1)).add(const Duration(hours: 11)), 'Reminder call for course demo.'),
    _t('7', 'Deal paperwork — Enterprise batch', TaskType.deal, 'Tomorrow, 10:00 AM', false, false, TaskPriority.medium, t.add(const Duration(days: 1, hours: 10)), 'Prepare and review deal contract agreements.'),
    _t('8', 'Welcome call — new admission', TaskType.call, 'Yesterday, 9:00 AM', true, false, TaskPriority.low, t.subtract(const Duration(days: 1)).add(const Duration(hours: 9)), 'Welcome call to onboarding student.'),
    _t('9', 'Quarterly review prep', TaskType.task, '2 days ago', true, false, TaskPriority.low, t.subtract(const Duration(days: 2)), 'Prepare presentation for quarterly performance review.'),
  ];
}
