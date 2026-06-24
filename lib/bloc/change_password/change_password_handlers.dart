import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'change_password_bloc.dart';
import 'change_password_event.dart';
import 'change_password_state.dart';
import 'change_password_inputs.dart';

void changePasswordCurrentPasswordChanged(
  ChangePasswordBloc bloc,
  CurrentPasswordChanged e,
  Emitter<ChangePasswordState> emit,
) {
  final current = ChangeCurrentPassword.dirty(e.password);
  emit(
    bloc.state.copyWith(
      currentPassword: current,
      status: FormzSubmissionStatus.initial,
      errorMessage: null,
    ),
  );
}

void changePasswordNewPasswordChanged(
  ChangePasswordBloc bloc,
  NewPasswordChanged e,
  Emitter<ChangePasswordState> emit,
) {
  final newPass = ChangeNewPassword.dirty(e.password);
  final confirm = ChangeConfirmPassword.dirty(
    newPassword: newPass.value,
    value: bloc.state.confirmPassword.value,
  );
  emit(
    bloc.state.copyWith(
      newPassword: newPass,
      confirmPassword: confirm,
      status: FormzSubmissionStatus.initial,
      errorMessage: null,
    ),
  );
}

void changePasswordConfirmPasswordChanged(
  ChangePasswordBloc bloc,
  ConfirmPasswordChanged e,
  Emitter<ChangePasswordState> emit,
) {
  final confirm = ChangeConfirmPassword.dirty(
    newPassword: bloc.state.newPassword.value,
    value: e.password,
  );
  emit(
    bloc.state.copyWith(
      confirmPassword: confirm,
      status: FormzSubmissionStatus.initial,
      errorMessage: null,
    ),
  );
}
