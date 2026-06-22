part of 'verify_otp_bloc.dart';

/// Base event class for [VerifyOtpBloc].
abstract class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent();

  @override
  List<Object?> get props => [];
}

/// Dispatched when the user changes the OTP input.
class VerifyOtpCodeChanged extends VerifyOtpEvent {
  final String code;

  const VerifyOtpCodeChanged(this.code);

  @override
  List<Object?> get props => [code];
}

/// Dispatched when the user submits the 6-digit OTP code.
class VerifyOtpSubmitted extends VerifyOtpEvent {
  const VerifyOtpSubmitted();
}

/// Dispatched by the periodic timer stream.
class VerifyOtpTimerTicked extends VerifyOtpEvent {
  final int secondsLeft;

  const VerifyOtpTimerTicked(this.secondsLeft);

  @override
  List<Object?> get props => [secondsLeft];
}

/// Dispatched when the user requests an OTP resend.
class VerifyOtpResendRequested extends VerifyOtpEvent {
  const VerifyOtpResendRequested();
}
