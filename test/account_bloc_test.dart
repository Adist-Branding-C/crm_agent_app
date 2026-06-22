import 'package:crm_agent_app/bloc/account/account_bloc.dart';
import 'package:crm_agent_app/bloc/account/account_models.dart';
import 'package:crm_agent_app/data/repositories/account_repository.dart';
import 'package:crm_agent_app/data/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAccountRepository implements AccountRepository {
  @override
  Future<AccountProfile> getProfile() async {
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

class MockAuthRepository implements AuthRepository {
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
  @override
  Future<void> sendOtp(String phone) async {}
  @override
  Future<bool> verifyOtp(String phone, String code) async => true;
  @override
  Future<bool> updatePassword(String phone, String password) async => true;
}

void main() {
  group('AccountBloc Unit Tests', () {
    late MockAccountRepository accountRepo;
    late MockAuthRepository authRepo;
    late AccountBloc bloc;

    setUp(() {
      accountRepo = MockAccountRepository();
      authRepo = MockAuthRepository();
      bloc = AccountBloc(accountRepository: accountRepo, authRepository: authRepo);
    });

    tearDown(() => bloc.close());

    test('initial state is AccountInitial', () {
      expect(bloc.state, const AccountInitial());
    });

    test('LoadAccount emits AccountLoading and AccountLoaded', () {
      expectLater(
        bloc.stream,
        emitsInOrder([
          const AccountLoading(),
          isA<AccountLoaded>().having((s) => s.profile.name, 'name', 'Arjun Nair'),
        ]),
      );
      bloc.add(const LoadAccount());
    });

    test('LogoutRequested calls logout and emits AccountLoggedOut', () {
      expectLater(
        bloc.stream,
        emitsInOrder([
          const AccountLoggedOut(),
        ]),
      );
      bloc.add(const LogoutRequested());
    });
  });
}
