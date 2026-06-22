import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../data/repositories/auth_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';
part 'forgot_password_inputs.dart';

/// BLoC to handle user inputs and validation for request OTP phase.
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository authRepository;

  ForgotPasswordBloc({required this.authRepository})
      : super(const ForgotPasswordState()) {
    on<ForgotPasswordPhoneChanged>(_onPhoneChanged);
    on<ForgotPasswordSubmitted>(_onSubmitted);
  }

  void _onPhoneChanged(
    ForgotPasswordPhoneChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    final phone = ForgotPasswordPhone.dirty(event.phone);
    emit(state.copyWith(
      phone: phone,
      status: FormzSubmissionStatus.initial,
      errorMessage: null,
    ));
  }

  Future<void> _onSubmitted(
    ForgotPasswordSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    final phone = ForgotPasswordPhone.dirty(state.phone.value);
    emit(state.copyWith(
      phone: phone,
      status: FormzSubmissionStatus.inProgress,
    ));

    if (phone.isNotValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      return;
    }

    try {
      await authRepository.sendOtp(phone.value);
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (_) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: 'Failed to send OTP. Please try again.',
      ));
    }
  }
}
