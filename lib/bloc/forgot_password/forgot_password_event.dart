part of 'forgot_password_bloc.dart';

/// Base event class for [ForgotPasswordBloc].
abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object?> get props => [];
}

/// Dispatched when the user alters the phone text field.
class ForgotPasswordPhoneChanged extends ForgotPasswordEvent {
  final String phone;

  const ForgotPasswordPhoneChanged(this.phone);

  @override
  List<Object?> get props => [phone];
}

/// Dispatched when the user taps "Send OTP".
class ForgotPasswordSubmitted extends ForgotPasswordEvent {
  const ForgotPasswordSubmitted();
}
