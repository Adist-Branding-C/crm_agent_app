part of 'account_bloc.dart';

/// Base class for all Account events.
abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load account profile data.
class LoadAccount extends AccountEvent {
  const LoadAccount();
}

/// Event to trigger user log out.
class LogoutRequested extends AccountEvent {
  const LogoutRequested();
}
