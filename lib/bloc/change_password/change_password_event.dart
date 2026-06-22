part of 'change_password_bloc.dart';

/// Base event class for [ChangePasswordBloc].
abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered when current password input changes.
class CurrentPasswordChanged extends ChangePasswordEvent {
  final String password;
  const CurrentPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

/// Event triggered when new password input changes.
class NewPasswordChanged extends ChangePasswordEvent {
  final String password;
  const NewPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

/// Event triggered when confirm password input changes.
class ConfirmPasswordChanged extends ChangePasswordEvent {
  final String password;
  const ConfirmPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

/// Event to toggle current password obscure state.
class ToggleCurrentPasswordVisibility extends ChangePasswordEvent {
  const ToggleCurrentPasswordVisibility();
}

/// Event to toggle new password obscure state.
class ToggleNewPasswordVisibility extends ChangePasswordEvent {
  const ToggleNewPasswordVisibility();
}

/// Event to toggle confirm password obscure state.
class ToggleConfirmPasswordVisibility extends ChangePasswordEvent {
  const ToggleConfirmPasswordVisibility();
}

/// Event triggered when user submits password change request.
class ChangePasswordSubmitted extends ChangePasswordEvent {
  const ChangePasswordSubmitted();
}
