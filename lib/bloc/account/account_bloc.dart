import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/account_repository.dart';
import '../../data/repositories/auth_repository.dart';
import 'account_models.dart';

part 'account_event.dart';
part 'account_state.dart';

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
      emit(const AccountError(errorMessage: 'Failed to load profile.'));
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
}
