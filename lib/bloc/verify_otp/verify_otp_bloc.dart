export 'verify_otp_event.dart';
export 'verify_otp_state.dart';
export 'verify_otp_inputs.dart';
export 'verify_otp_handlers.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../data/repositories/otp_repository.dart';
import 'otp_timer_service.dart';

import 'verify_otp_event.dart';
import 'verify_otp_state.dart';
import 'verify_otp_inputs.dart';
import 'verify_otp_handlers.dart';

/// BLoC managing events, states, and timers for OTP verification.
class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final OtpRepository authRepository;
  final String phone;
  final OtpTimerService timerService = OtpTimerService();

  VerifyOtpBloc({required this.authRepository, required this.phone})
    : super(const VerifyOtpState()) {
    on<VerifyOtpCodeChanged>(
      (e, emit) => emit(
        state.copyWith(
          code: VerifyOtpCode.dirty(e.code),
          status: FormzSubmissionStatus.initial,
          clearFailure: true,
        ),
      ),
    );
    on<VerifyOtpTimerTicked>(
      (e, emit) => emit(
        state.copyWith(
          timerCount: e.secondsLeft,
          canResend: e.secondsLeft <= 0,
        ),
      ),
    );
    on<VerifyOtpResendRequested>(onResend);
    on<VerifyOtpSubmitted>(onSubmitted);
    timerService.start((s) => add(VerifyOtpTimerTicked(s)));
  }

  @override
  Future<void> close() {
    timerService.cancel();
    return super.close();
  }
}
