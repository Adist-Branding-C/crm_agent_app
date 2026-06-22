import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/account_repository.dart';
import '../../data/repositories/auth_repository.dart';
import 'account_event.dart';
import 'account_state.dart';

export 'account_event.dart';
export 'account_state.dart';

/// BLoC managing states and events for the Account/Profile screen.
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository accountRepository;
  final AuthRepository authRepository;

  /// Initializes the AccountBloc with its repositories.
  AccountBloc({
    required this.accountRepository,
    required this.authRepository,
  }) : super(const AccountInitial()) {
    on<LoadAccount>(_onLoadAccount);
    on<LogoutRequested>(_onLogoutRequested);
    on<UpdateProfile>(_onUpdateProfile);
  }

  Future<void> _onLoadAccount(
    LoadAccount event,
    Emitter<AccountState> emit,
  ) async {
    emit(const AccountLoading());
    try {
      final profile = await accountRepository.getProfile();
      emit(AccountLoaded(profile: profile));
    } catch (_) {
      emit(const AccountError(failure: AccountFailure.loadProfile));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AccountState> emit,
  ) async {
    try {
      await authRepository.logout();
      emit(const AccountLoggedOut());
    } catch (_) {
      emit(const AccountLoggedOut());
    }
  }

  Future<void> _onUpdateProfile(
    UpdateProfile event,
    Emitter<AccountState> emit,
  ) async {
    final currentState = state;
    if (currentState is AccountLoaded) {
      emit(AccountUpdating(profile: currentState.profile));
      try {
        final updated = await accountRepository.updateProfile(event.profile);
        emit(AccountUpdateSuccess(profile: updated));
      } catch (_) {
        emit(AccountUpdateFailure(
          profile: currentState.profile,
          error: 'Failed to update profile details.',
        ));
      }
    }
  }
}
