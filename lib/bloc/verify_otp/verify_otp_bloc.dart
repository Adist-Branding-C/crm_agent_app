import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../data/repositories/auth_repository.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';
part 'verify_otp_inputs.dart';

/// BLoC to handle state transitions for the OTP verification screen.
class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final AuthRepository authRepository;
  final String phone;
  StreamSubscription<int>? _timerSub;

  VerifyOtpBloc({
    required this.authRepository,
    required this.phone,
  }) : super(const VerifyOtpState()) {
    on<VerifyOtpCodeChanged>((event, emit) {
      emit(state.copyWith(
        code: VerifyOtpCode.dirty(event.code),
        status: FormzSubmissionStatus.initial,
        errorMessage: null,
      ));
    });
    on<VerifyOtpTimerTicked>((event, emit) {
      emit(state.copyWith(
        timerCount: event.secondsLeft,
        canResend: event.secondsLeft <= 0,
      ));
    });
    on<VerifyOtpResendRequested>(_onResend);
    on<VerifyOtpSubmitted>(_onSubmitted);
    _start();
  }

  Future<void> _onResend(
    VerifyOtpResendRequested e,
    Emitter<VerifyOtpState> emit,
  ) async {
    if (!state.canResend) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await authRepository.sendOtp(phone);
      emit(state.copyWith(
        status: FormzSubmissionStatus.initial,
        canResend: false,
        timerCount: 30,
      ));
      _start();
    } catch (_) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: 'Failed to resend OTP.',
      ));
    }
  }

  Future<void> _onSubmitted(
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
      emit(state.copyWith(
        status: ok
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure,
        errorMessage: ok ? null : 'Incorrect code.',
      ));
    } catch (_) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: 'An error occurred.',
      ));
    }
  }

  void _start() {
    _timerSub?.cancel();
    _timerSub = Stream.periodic(
      const Duration(seconds: 1),
      (x) => 29 - x,
    ).take(30).listen((s) => add(VerifyOtpTimerTicked(s)));
  }

  @override
  Future<void> close() {
    _timerSub?.cancel();
    return super.close();
  }
}
