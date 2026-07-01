import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'verify_otp_bloc.dart';
import 'verify_otp_failure.dart';

/// Extension containing resend and submission event handlers for [VerifyOtpBloc].
extension VerifyOtpHandlers on VerifyOtpBloc {
  /// Handler to resend OTP to the registered phone number.
  Future<void> onResend(
    VerifyOtpResendRequested e,
    Emitter<VerifyOtpState> emit,
  ) async {
    if (!state.canResend) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await authRepository.sendOtp(phone);
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.initial,
          canResend: false,
          timerCount: 30,
        ),
      );
      timerService.start((s) => add(VerifyOtpTimerTicked(s)));
    } catch (_) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          failure: VerifyOtpFailure.resend,
        ),
      );
    }
  }

  /// Handler to verify code validity and submit it to the repository.
  Future<void> onSubmitted(
    VerifyOtpSubmitted e,
    Emitter<VerifyOtpState> emit,
  ) async {
    final code = VerifyOtpCode.dirty(state.code.value);
    emit(state.copyWith(code: code, status: FormzSubmissionStatus.inProgress));
    if (code.isNotValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      return;
    }
    try {
      final ok = await authRepository.verifyOtp(phone, code.value);
      emit(
        state.copyWith(
          status: ok
              ? FormzSubmissionStatus.success
              : FormzSubmissionStatus.failure,
          failure: ok ? null : VerifyOtpFailure.incorrectCode,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          failure: VerifyOtpFailure.unknown,
        ),
      );
    }
  }
}
