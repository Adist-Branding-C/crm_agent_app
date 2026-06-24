export 'verify_otp_event.dart';
export 'verify_otp_state.dart';
export 'verify_otp_inputs.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../data/repositories/otp_repository.dart';
import 'otp_timer_service.dart';
import 'verify_otp_failure.dart';

import 'verify_otp_event.dart';
import 'verify_otp_state.dart';
import 'verify_otp_inputs.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final OtpRepository authRepository;
  final String phone;
  final OtpTimerService _timerService = OtpTimerService();

  VerifyOtpBloc({
    required this.authRepository,
    required this.phone,
  }) : super(const VerifyOtpState()) {
    on<VerifyOtpCodeChanged>((e, emit) => emit(state.copyWith(
      code: VerifyOtpCode.dirty(e.code),
      status: FormzSubmissionStatus.initial,
      clearFailure: true,
    )));
    on<VerifyOtpTimerTicked>((e, emit) => emit(state.copyWith(
      timerCount: e.secondsLeft,
      canResend: e.secondsLeft <= 0,
    )));
    on<VerifyOtpResendRequested>(_onResend);
    on<VerifyOtpSubmitted>(_onSubmitted);
    _timerService.start((s) => add(VerifyOtpTimerTicked(s)));
  }

  Future<void> _onResend(VerifyOtpResendRequested e, Emitter<VerifyOtpState> emit) async {
    if (!state.canResend) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await authRepository.sendOtp(phone);
      emit(state.copyWith(status: FormzSubmissionStatus.initial, canResend: false, timerCount: 30));
      _timerService.start((s) => add(VerifyOtpTimerTicked(s)));
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure, failure: VerifyOtpFailure.resend));
    }
  }

  Future<void> _onSubmitted(VerifyOtpSubmitted e, Emitter<VerifyOtpState> emit) async {
    final code = VerifyOtpCode.dirty(state.code.value);
    emit(state.copyWith(code: code, status: FormzSubmissionStatus.inProgress));
    if (code.isNotValid) { emit(state.copyWith(status: FormzSubmissionStatus.failure)); return; }
    try {
      final ok = await authRepository.verifyOtp(phone, code.value);
      emit(state.copyWith(
        status: ok ? FormzSubmissionStatus.success : FormzSubmissionStatus.failure,
        failure: ok ? null : VerifyOtpFailure.incorrectCode,
      ));
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure, failure: VerifyOtpFailure.unknown));
    }
  }

  @override
  Future<void> close() { _timerService.cancel(); return super.close(); }
}
