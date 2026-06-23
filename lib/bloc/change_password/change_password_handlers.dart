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
}
