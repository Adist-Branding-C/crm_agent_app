import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  /// Creates a constant [LoginEvent].
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

/// Event that triggers toggling the password text obscurity.
class TogglePasswordVisibility extends LoginEvent {
  /// Creates a constant [TogglePasswordVisibility] event.
  const TogglePasswordVisibility();
}

/// Event dispatched when the phone number input changes.
class PhoneChanged extends LoginEvent {
  /// Creates a [PhoneChanged] event with the new [phone] input.
  const PhoneChanged(this.phone);

  /// The updated phone number text.
  final String phone;

  @override
  List<Object?> get props => [phone];
}

/// Event dispatched when the password input changes.
class PasswordChanged extends LoginEvent {
  /// Creates a [PasswordChanged] event with the new [password] input.
  const PasswordChanged(this.password);

  /// The updated password text.
  final String password;

  @override
  List<Object?> get props => [password];
}

/// Event that handles login credential submission.
class LoginSubmitted extends LoginEvent {
  /// Creates a constant [LoginSubmitted] event.
  const LoginSubmitted();
}
