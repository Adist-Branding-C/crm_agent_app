import 'package:equatable/equatable.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object?> get props => [];
}

class CurrentPasswordChanged extends ChangePasswordEvent {
  final String password;
  const CurrentPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class NewPasswordChanged extends ChangePasswordEvent {
  final String password;
  const NewPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class ConfirmPasswordChanged extends ChangePasswordEvent {
  final String password;
  const ConfirmPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class ToggleCurrentPasswordVisibility extends ChangePasswordEvent {
  const ToggleCurrentPasswordVisibility();
}

class ToggleNewPasswordVisibility extends ChangePasswordEvent {
  const ToggleNewPasswordVisibility();
}

class ToggleConfirmPasswordVisibility extends ChangePasswordEvent {
  const ToggleConfirmPasswordVisibility();
}

class ChangePasswordSubmitted extends ChangePasswordEvent {
  const ChangePasswordSubmitted();
}
