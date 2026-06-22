part of 'verify_otp_bloc.dart';

/// State representation of the OTP Verification flow.
class VerifyOtpState extends Equatable {
  final VerifyOtpCode code;
  final FormzSubmissionStatus status;
  final int timerCount;
  final bool canResend;
  final String? errorMessage;

  const VerifyOtpState({
    this.code = const VerifyOtpCode.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.timerCount = 30,
    this.canResend = false,
    this.errorMessage,
  });

  /// Factory method to copy state with modified fields.
  VerifyOtpState copyWith({
    VerifyOtpCode? code,
    FormzSubmissionStatus? status,
    int? timerCount,
    bool? canResend,
    String? errorMessage,
  }) {
    return VerifyOtpState(
      code: code ?? this.code,
      status: status ?? this.status,
      timerCount: timerCount ?? this.timerCount,
      canResend: canResend ?? this.canResend,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [code, status, timerCount, canResend, errorMessage];
}
