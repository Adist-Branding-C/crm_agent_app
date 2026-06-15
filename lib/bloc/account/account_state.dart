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

/// Error state.
class AccountError extends AccountState {
  final String errorMessage;

  const AccountError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

/// State representing a successful logout transition.
class AccountLoggedOut extends AccountState {
  const AccountLoggedOut();
}
