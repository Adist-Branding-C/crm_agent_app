import 'package:equatable/equatable.dart';

class AccountProfile extends Equatable {
  final String initials;
  final String name;
  final String role;
  final String branch;
  final String email;
  final String phone;
  final int wonDeals;
  final int myLeads;
  final double conversionRate;
  final int notificationCount;
  final String joinedDate;
  final String baseLocation;
  final int monthlyTarget;
  final int achievedAmount;

  const AccountProfile({
    required this.initials,
    required this.name,
    required this.role,
    required this.branch,
    required this.email,
    required this.phone,
    required this.wonDeals,
    required this.myLeads,
    required this.conversionRate,
    required this.notificationCount,
    required this.joinedDate,
    required this.baseLocation,
    required this.monthlyTarget,
    required this.achievedAmount,
  });

  @override
  List<Object?> get props => [
        initials, name, role, branch, email, phone, wonDeals, myLeads,
        conversionRate, notificationCount, joinedDate, baseLocation,
        monthlyTarget, achievedAmount,
      ];
}
