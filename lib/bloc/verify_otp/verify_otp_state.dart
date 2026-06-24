import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'verify_otp_failure.dart';
import 'verify_otp_inputs.dart';

class VerifyOtpState extends Equatable {
  final VerifyOtpCode code;
  final FormzSubmissionStatus status;
  final int timerCount;
  final bool canResend;
  final VerifyOtpFailure? failure;

  const VerifyOtpState({
    this.code = const VerifyOtpCode.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.timerCount = 30,
    this.canResend = false,
    this.failure,
  });

  String? get errorMessage => failure?.message;

  VerifyOtpState copyWith({
    VerifyOtpCode? code,
    FormzSubmissionStatus? status,
    int? timerCount,
    bool? canResend,
    VerifyOtpFailure? failure,
    bool clearFailure = false,
  }) {
    return VerifyOtpState(
      code: code ?? this.code,
      status: status ?? this.status,
      timerCount: timerCount ?? this.timerCount,
      canResend: canResend ?? this.canResend,
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }

  @override
  List<Object?> get props => [code, status, timerCount, canResend, failure];
}
