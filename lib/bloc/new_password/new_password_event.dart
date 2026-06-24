import 'package:equatable/equatable.dart';

abstract class NewPasswordEvent extends Equatable {
  const NewPasswordEvent();

  @override
  List<Object?> get props => [];
}

class NewPasswordChanged extends NewPasswordEvent {
  final String password;

  const NewPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class NewConfirmPasswordChanged extends NewPasswordEvent {
  final String confirmPassword;

  const NewConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object?> get props => [confirmPassword];
}

class ToggleNewPasswordVisibility extends NewPasswordEvent {
  const ToggleNewPasswordVisibility();
}

class ToggleConfirmPasswordVisibility extends NewPasswordEvent {
  const ToggleConfirmPasswordVisibility();
}

class NewPasswordSubmitted extends NewPasswordEvent {
  const NewPasswordSubmitted();
}
