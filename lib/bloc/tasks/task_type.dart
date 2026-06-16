/// Type of task item.
enum TaskType {
  task('Task'),
  meeting('Meeting'),
  call('Call'),
  deal('Deal');

  final String label;
  const TaskType(this.label);
}
