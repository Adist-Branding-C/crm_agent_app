/// Time-based filter options for My Activity page.
enum ActivityTimeFilter {
  all('All'),
  today('Today'),
  yesterday('Yesterday'),
  thisWeek('This Week');

  final String label;
  const ActivityTimeFilter(this.label);
}

/// Entity type filter options for My Activity page.
enum ActivityTypeFilter {
  all('All'),
  lead('Lead'),
  task('Task'),
  deal('Deal'),
  call('Call');

  final String label;
  const ActivityTypeFilter(this.label);
}

/// Semantic status of an activity item.
enum ActivityStatus {
  done,
  deleted,
  edited,
  assigned,
  created,
  call,
  won,
  statusChange,
  note;

  String get label {
    switch (this) {
      case ActivityStatus.done:
        return 'Done';
      case ActivityStatus.deleted:
        return 'Deleted';
      case ActivityStatus.edited:
        return 'Edited';
      case ActivityStatus.assigned:
        return 'Assigned';
      case ActivityStatus.created:
        return 'Created';
      case ActivityStatus.call:
        return 'Call';
      case ActivityStatus.won:
        return 'Won';
      case ActivityStatus.statusChange:
        return 'Status';
      case ActivityStatus.note:
        return 'Note';
    }
  }
}
