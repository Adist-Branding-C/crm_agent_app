part of 'change_password_bloc.dart';

extension ChangePasswordHandlers on ChangePasswordBloc {
  void _onCurrentPasswordChanged(
    CurrentPasswordChanged e,
    Emitter<ChangePasswordState> emit,
  ) {
    final current = ChangeCurrentPassword.dirty(e.password);
    emit(state.copyWith(
      currentPassword: current,
      status: FormzSubmissionStatus.initial,
      errorMessage: null,
    ));
  }

  void _onNewPasswordChanged(
    NewPasswordChanged e,
    Emitter<ChangePasswordState> emit,
  ) {
    final newPass = ChangeNewPassword.dirty(e.password);
    final confirm = ChangeConfirmPassword.dirty(
      newPassword: newPass.value,
      value: state.confirmPassword.value,
    );
    emit(state.copyWith(
      newPassword: newPass,
      confirmPassword: confirm,
      status: FormzSubmissionStatus.initial,
      errorMessage: null,
    ));
  }

  void _onConfirmPasswordChanged(
    ConfirmPasswordChanged e,
    Emitter<ChangePasswordState> emit,
  ) {
    final confirm = ChangeConfirmPassword.dirty(
      newPassword: state.newPassword.value,
      value: e.password,
    );
    emit(state.copyWith(
      confirmPassword: confirm,
      status: FormzSubmissionStatus.initial,
      errorMessage: null,
    ));
  }

  void _onToggleCurrentPasswordVisibility(
    ToggleCurrentPasswordVisibility e,
    Emitter<ChangePasswordState> emit,
  ) => emit(state.copyWith(obscureCurrentPassword: !state.obscureCurrentPassword));

  void _onToggleNewPasswordVisibility(
    ToggleNewPasswordVisibility e,
    Emitter<ChangePasswordState> emit,
  ) => emit(state.copyWith(obscureNewPassword: !state.obscureNewPassword));

  void _onToggleConfirmPasswordVisibility(
    ToggleConfirmPasswordVisibility e,
    Emitter<ChangePasswordState> emit,
  ) => emit(state.copyWith(obscureConfirmPassword: !state.obscureConfirmPassword));

  Future<void> _onSubmitted(
    ChangePasswordSubmitted e,
    Emitter<ChangePasswordState> emit,
  ) async {
    final current = ChangeCurrentPassword.dirty(state.currentPassword.value);
    final newPass = ChangeNewPassword.dirty(state.newPassword.value);
    final confirm = ChangeConfirmPassword.dirty(
      newPassword: newPass.value,
      value: state.confirmPassword.value,
    );
    emit(state.copyWith(
      currentPassword: current,
      newPassword: newPass,
      confirmPassword: confirm,
      status: FormzSubmissionStatus.inProgress,
    ));
    if (current.isNotValid || newPass.isNotValid || confirm.isNotValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      return;
    }
    try {
      final success = await authRepository.changePassword(
        current.value,
        newPass.value,
      );
      emit(state.copyWith(
        status: success ? FormzSubmissionStatus.success : FormzSubmissionStatus.failure,
        errorMessage: success ? null : 'Failed to update password.',
      ));
    } catch (_) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: 'An error occurred.',
      ));
    }
  }
}
