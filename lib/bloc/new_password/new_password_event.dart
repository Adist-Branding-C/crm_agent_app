part of 'new_password_bloc.dart';

/// Base event class for [NewPasswordBloc].
abstract class NewPasswordEvent extends Equatable {
  const NewPasswordEvent();

  @override
  List<Object?> get props => [];
}

/// Dispatched when the new password text input changes.
class NewPasswordChanged extends NewPasswordEvent {
  final String password;

  const NewPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

/// Dispatched when the confirm password text input changes.
class NewConfirmPasswordChanged extends NewPasswordEvent {
  final String confirmPassword;

  const NewConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object?> get props => [confirmPassword];
}

/// Dispatched to toggle visibility of the new password.
class ToggleNewPasswordVisibility extends NewPasswordEvent {
  const ToggleNewPasswordVisibility();
}

/// Dispatched to toggle visibility of the confirm password.
class ToggleConfirmPasswordVisibility extends NewPasswordEvent {
  const ToggleConfirmPasswordVisibility();
}

/// Dispatched when the user submits the password update.
class NewPasswordSubmitted extends NewPasswordEvent {
  const NewPasswordSubmitted();
}
