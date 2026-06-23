import 'package:crm_agent_app/bloc/account/account_models.dart';
import 'package:crm_agent_app/data/repositories/account_repository.dart';
import 'package:crm_agent_app/data/repositories/session_repository.dart';

class MockAccountRepository implements AccountRepository {
  AccountProfile? _cachedProfile;

  @override
  Future<AccountProfile> getProfile() async {
    return _cachedProfile ??= const AccountProfile(
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
      joinedDate: 'Mar 2023',
      baseLocation: 'Calicut, Kerala',
      monthlyTarget: 800000,
      achievedAmount: 612000,
    );
  }

  @override
  Future<AccountProfile> updateProfile(AccountProfile profile) async {
    _cachedProfile = profile;
    return profile;
  }
}

class MockAuthRepository implements SessionRepository {
  @override
  bool get isAuthenticated => true;
  @override
  bool get isInitialized => true;
  @override
  Future<bool> login(String p, String pass) async => true;
  @override
  Future<String?> getToken() async => 'mock';
  @override
  Future<void> logout() async {}
  @override
  Future<void> init() async {}
}
