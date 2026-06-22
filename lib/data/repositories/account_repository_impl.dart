import '../../bloc/account/account_models.dart';
import 'account_repository.dart';

/// Concrete implementation of [AccountRepository] returning mock data.
class AccountRepositoryImpl implements AccountRepository {
  AccountProfile? _cachedProfile;

  @override
  Future<AccountProfile> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _cachedProfile ??= const AccountProfile(
      initials: 'AN',
      name: 'Arjun Nair',
      role: 'Sales Agent',
      branch: 'Calicut',
      email: 'arjun.nair@adist.in',
      phone: '+91 98470 21188',
      wonDeals: 11,
      myLeads: 96,
      conversionRate: 0.64,
      notificationCount: 3,
      joinedDate: 'Mar 2023',
      baseLocation: 'Calicut, Kerala',
      monthlyTarget: 800000,
      achievedAmount: 612000,
    );
  }

  @override
  Future<AccountProfile> updateProfile(AccountProfile profile) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _cachedProfile = profile;
    return profile;
  }
}
