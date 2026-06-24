import 'package:equatable/equatable.dart';

enum FollowUpTag {
  priority('priority', 'Priority'),
  followUp('follow up', 'Follow Up');

  final String value;
  final String label;
  const FollowUpTag(this.value, this.label);
}

class FollowUpCall extends Equatable {
  final FollowUpTag tag;
  final String name;
  final String time;

  const FollowUpCall({required this.tag, required this.name, required this.time});

  @override
  List<Object?> get props => [tag, name, time];
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
  List<Object?> get props => [activeCampaigns, openDeals, analyticsConversionRate, attendanceStatus];
}
