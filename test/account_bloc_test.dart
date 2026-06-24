import 'package:crm_agent_app/bloc/account/account_bloc.dart';
import 'package:crm_agent_app/bloc/account/account_profile_extensions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'mock_account_repositories.dart';

void main() {
  group('AccountBloc Unit Tests', () {
    late MockAccountRepository accountRepo;
    late MockAuthRepository authRepo;
    late AccountBloc bloc;

    setUp(() {
      accountRepo = MockAccountRepository();
      authRepo = MockAuthRepository();
      bloc = AccountBloc(
        accountRepository: accountRepo,
        authRepository: authRepo,
      );
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
          isA<AccountLoaded>().having(
            (s) => s.profile.name,
            'name',
            'Arjun Nair',
          ),
        ]),
      );
      bloc.add(const LoadAccount());
    });

    test('LogoutRequested calls logout and emits AccountLoggedOut', () {
      expectLater(bloc.stream, emitsInOrder([const AccountLoggedOut()]));
      bloc.add(const LogoutRequested());
    });

    test(
      'UpdateProfile emits AccountUpdating and AccountUpdateSuccess',
      () async {
        bloc.add(const LoadAccount());
        await bloc.stream.firstWhere((s) => s is AccountLoaded);

        final p = (bloc.state as AccountLoaded).profile;
        final updated = p.copyWith(name: 'Updated Name');

        expectLater(
          bloc.stream,
          emitsInOrder([
            isA<AccountUpdating>(),
            isA<AccountUpdateSuccess>().having(
              (s) => s.profile.name,
              'name',
              'Updated Name',
            ),
          ]),
        );

        bloc.add(UpdateProfile(profile: updated));
      },
    );
  });
}
