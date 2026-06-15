import 'package:equatable/equatable.dart';

/// Model representing the user's profile and monthly performance stats.
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

  /// Creates a constant [AccountProfile].
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
  });

  @override
  List<Object?> get props => [
        initials,
        name,
        role,
        branch,
        email,
        phone,
        wonDeals,
        myLeads,
        conversionRate,
        notificationCount,
      ];
}
