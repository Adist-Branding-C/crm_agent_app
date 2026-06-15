import '../../bloc/account/account_models.dart';

/// Repository interface managing the agent account profile data.
abstract class AccountRepository {
  /// Fetches the profile and stats for the logged-in agent.
  Future<AccountProfile> getProfile();
}

/// Concrete implementation of [AccountRepository] returning mock data.
class AccountRepositoryImpl implements AccountRepository {
  @override
  Future<AccountProfile> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const AccountProfile(
      initials: 'AN',
      name: 'Arjun Nair',
      role: 'Sales Agent',
      branch: 'Calicut Branch',
      email: 'arjun.nair@example.com',
      phone: '+91 98765 43210',
      wonDeals: 11,
      myLeads: 96,
      conversionRate: 0.64,
      notificationCount: 3,
    );
  }
}
