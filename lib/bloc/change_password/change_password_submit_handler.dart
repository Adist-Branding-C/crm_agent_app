part of 'change_password_bloc.dart';

extension ChangePasswordSubmitHandler on ChangePasswordBloc {
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
        status: success ?
            FormzSubmissionStatus.success : FormzSubmissionStatus.failure,
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
