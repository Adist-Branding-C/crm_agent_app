import 'account_models.dart';

/// Extension to add copyWith utility to [AccountProfile].
extension AccountProfileExtension on AccountProfile {
  AccountProfile copyWith({
    String? initials,
    String? name,
    String? role,
    String? branch,
    String? email,
    String? phone,
    int? wonDeals,
    int? myLeads,
    double? conversionRate,
    int? notificationCount,
    String? joinedDate,
    String? baseLocation,
    int? monthlyTarget,
    int? achievedAmount,
  }) {
    return AccountProfile(
      initials: initials ?? this.initials,
      name: name ?? this.name,
      role: role ?? this.role,
      branch: branch ?? this.branch,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      wonDeals: wonDeals ?? this.wonDeals,
      myLeads: myLeads ?? this.myLeads,
      conversionRate: conversionRate ?? this.conversionRate,
      notificationCount: notificationCount ?? this.notificationCount,
      joinedDate: joinedDate ?? this.joinedDate,
      baseLocation: baseLocation ?? this.baseLocation,
      monthlyTarget: monthlyTarget ?? this.monthlyTarget,
      achievedAmount: achievedAmount ?? this.achievedAmount,
    );
  }
}
