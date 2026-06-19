import 'my_activity_model.dart';
import 'my_activity_enums.dart';

/// Second batch of mock activity data.
List<MyActivityItem> secondBatchActivities() => const [
  MyActivityItem(
    id: 'act8', title: 'Won deal',
    description: 'Diploma · ₹65,000',
    status: ActivityStatus.won, entityType: ActivityTypeFilter.deal,
    assignee: 'Lakshmi Warrior', time: '5:20 PM', dateLabel: 'May 11, 2026',
  ),
  MyActivityItem(
    id: 'act9', title: 'Completed task',
    description: 'Welcome call & onboarding',
    status: ActivityStatus.done, entityType: ActivityTypeFilter.task,
    assignee: 'Aravind Krishnan', time: '9:05 AM', dateLabel: 'May 11, 2026',
  ),
  MyActivityItem(
    id: 'act10', title: 'Deleted enquiry',
    description: 'Duplicate record removed',
    status: ActivityStatus.deleted, entityType: ActivityTypeFilter.lead,
    assignee: 'Unknown caller', time: '8:40 AM', dateLabel: 'May 11, 2026',
  ),
  MyActivityItem(
    id: 'act11', title: 'Edited deal',
    description: 'Stage → Negotiation',
    status: ActivityStatus.edited, entityType: ActivityTypeFilter.deal,
    assignee: 'Fathima Zohra', time: '3:15 PM', dateLabel: 'May 9, 2026',
  ),
  MyActivityItem(
    id: 'act12', title: 'Task assigned to you',
    description: 'Deal paperwork — corporate batch',
    status: ActivityStatus.assigned, entityType: ActivityTypeFilter.task,
    assignee: 'Fathima Zohra', time: '11:00 AM', dateLabel: 'May 9, 2026',
  ),
  MyActivityItem(
    id: 'act13', title: 'Created enquiry',
    description: 'Walk-in · New Admission',
    status: ActivityStatus.created, entityType: ActivityTypeFilter.lead,
    assignee: 'Karthik Nambiar', time: '4:30 PM', dateLabel: 'May 8, 2026',
  ),
  MyActivityItem(
    id: 'act14', title: 'Logged a call',
    description: 'Not answered · retry',
    status: ActivityStatus.call, entityType: ActivityTypeFilter.call,
    assignee: 'Vishnu Prasad', time: '10:20 AM', dateLabel: 'May 8, 2026',
  ),
];
