import 'package:equatable/equatable.dart';
import 'account_models.dart';

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

/// Event to update user profile.
class UpdateProfile extends AccountEvent {
  final AccountProfile profile;
  const UpdateProfile({required this.profile});

  @override
  List<Object?> get props => [profile];
}
