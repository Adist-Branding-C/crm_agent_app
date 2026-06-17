part of 'account_bloc.dart';

/// Base class for all Account states.
abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object?> get props => [];
}

/// Initial state.
class AccountInitial extends AccountState {
  const AccountInitial();
}

/// Loading state.
class AccountLoading extends AccountState {
  const AccountLoading();
}

/// State containing successfully loaded profile details.
class AccountLoaded extends AccountState {
  final AccountProfile profile;

  const AccountLoaded({required this.profile});

  @override
  List<Object?> get props => [profile];
}

enum AccountFailure { loadProfile, logout, unknown }

/// Error state.
class AccountError extends AccountState {
  final AccountFailure failure;

  const AccountError({required this.failure});

  String get errorMessage {
    switch (failure) {
      case AccountFailure.loadProfile: return 'Failed to load profile.';
      case AccountFailure.logout: return 'Failed to logout.';
      case AccountFailure.unknown: return 'An error occurred.';
    }
  }

  @override
  List<Object?> get props => [failure];
}

/// State representing a successful logout transition.
class AccountLoggedOut extends AccountState {
  const AccountLoggedOut();
}
