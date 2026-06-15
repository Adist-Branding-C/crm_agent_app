import 'package:equatable/equatable.dart';

/// Tag type for dashboard follow-up calls.
enum FollowUpTag {
  priority('priority', 'Priority'),
  followUp('follow up', 'Follow Up');

  final String value;
  final String label;
  const FollowUpTag(this.value, this.label);
}

/// Models representing a single follow-up call item.
class FollowUpCall extends Equatable {
  final FollowUpTag tag;
  final String name;
  final String time;

  const FollowUpCall({
    required this.tag,
    required this.name,
    required this.time,
  });

  @override
  List<Object?> get props => [tag, name, time];
}

/// Type of task item.
enum TaskType {
  call('Call'),
  task('Task'),
  meeting('Meeting');

  final String label;
  const TaskType(this.label);
}

/// Models representing a single task item.
class TaskItem extends Equatable {
  final TaskType type;
  final String name;
  final String time;

  const TaskItem({required this.type, required this.name, required this.time});

  @override
  List<Object?> get props => [type, name, time];
}

/// Models representing stats metrics shown at the top.
class DashboardStats extends Equatable {
  final int activeCampaigns;
  final int openDeals;
  final double analyticsConversionRate;
  final String attendanceStatus;

  const DashboardStats({
    required this.activeCampaigns,
    required this.openDeals,
    required this.analyticsConversionRate,
    required this.attendanceStatus,
  });

  @override
  List<Object?> get props => [
    activeCampaigns,
    openDeals,
    analyticsConversionRate,
    attendanceStatus,
  ];
}
