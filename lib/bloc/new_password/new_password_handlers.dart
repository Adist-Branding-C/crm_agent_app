part of 'new_password_bloc.dart';

extension NewPasswordHandlers on NewPasswordBloc {
  void _onPasswordChanged(
    NewPasswordChanged e,
    Emitter<NewPasswordState> emit,
  ) {
    final password = NewPassword.dirty(e.password);
    final confirm = NewConfirmPassword.dirty(
      password: password.value,
      value: state.confirmPassword.value,
    );
    emit(state.copyWith(
      newPassword: password,
      confirmPassword: confirm,
      status: FormzSubmissionStatus.initial,
      errorMessage: null,
    ));
  }

  void _onConfirmPasswordChanged(
    NewConfirmPasswordChanged e,
    Emitter<NewPasswordState> emit,
  ) {
    final confirm = NewConfirmPassword.dirty(
      password: state.newPassword.value,
      value: e.confirmPassword,
    );
    emit(state.copyWith(
      confirmPassword: confirm,
      status: FormzSubmissionStatus.initial,
      errorMessage: null,
    ));
  }

  void _onToggleNewPasswordVisibility(
    ToggleNewPasswordVisibility e,
    Emitter<NewPasswordState> emit,
  ) => emit(state.copyWith(obscureNewPassword: !state.obscureNewPassword));

  void _onToggleConfirmPasswordVisibility(
    ToggleConfirmPasswordVisibility e,
    Emitter<NewPasswordState> emit,
  ) => emit(state.copyWith(obscureConfirmPassword: !state.obscureConfirmPassword));

  Future<void> _onSubmitted(
    NewPasswordSubmitted e,
    Emitter<NewPasswordState> emit,
  ) async {
    final password = NewPassword.dirty(state.newPassword.value);
    final confirm = NewConfirmPassword.dirty(
      password: password.value,
      value: state.confirmPassword.value,
    );
    emit(state.copyWith(
      newPassword: password,
      confirmPassword: confirm,
      status: FormzSubmissionStatus.inProgress,
    ));
    if (password.isNotValid || confirm.isNotValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      return;
    }
    try {
      final ok = await authRepository.updatePassword(phone, password.value);
      emit(state.copyWith(
        status:
            ok ? FormzSubmissionStatus.success : FormzSubmissionStatus.failure,
        errorMessage: ok ? null : 'Failed to update password.',
      ));
    } catch (_) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: 'An error occurred.',
      ));
    }
  }
}
