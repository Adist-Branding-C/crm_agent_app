import 'package:equatable/equatable.dart';

enum FollowUpTag {
  priority('priority', 'Priority'),
  followUp('follow up', 'Follow Up');

  final String value;
  final String label;
  const FollowUpTag(this.value, this.label);
}

class FollowUpCall extends Equatable {
  final String id;
  final FollowUpTag tag;
  final String name;
  final String time;
  final String description;
  final DateTime scheduledTime;

  const FollowUpCall({
    required this.id,
    required this.tag,
    required this.name,
    required this.time,
    required this.scheduledTime,
    this.description = '',
  });

  bool get isOverdue => scheduledTime.isBefore(DateTime.now());

  @override
  List<Object?> get props => [id, tag, name, time, description, scheduledTime];
}

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
