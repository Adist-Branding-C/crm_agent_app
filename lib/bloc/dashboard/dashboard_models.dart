import 'package:equatable/equatable.dart';

/// Models representing a single follow-up call item.
class FollowUpCall extends Equatable {
  final String tag; // priority, follow up, etc.
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

/// Models representing a single task item.
class TaskItem extends Equatable {
  final String type; // Call, Task, Meeting
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
