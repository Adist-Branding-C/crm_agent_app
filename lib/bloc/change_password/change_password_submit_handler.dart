import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'change_password_bloc.dart';
import 'change_password_event.dart';
import 'change_password_state.dart';
import 'change_password_inputs.dart';

Future<void> changePasswordSubmitted(
  ChangePasswordBloc bloc,
  ChangePasswordSubmitted e,
  Emitter<ChangePasswordState> emit,
) async {
  final current = ChangeCurrentPassword.dirty(bloc.state.currentPassword.value);
  final newPass = ChangeNewPassword.dirty(bloc.state.newPassword.value);
  final confirm = ChangeConfirmPassword.dirty(
    newPassword: newPass.value,
    value: bloc.state.confirmPassword.value,
  );
  emit(bloc.state.copyWith(
    currentPassword: current,
    newPassword: newPass,
    confirmPassword: confirm,
    status: FormzSubmissionStatus.inProgress,
  ));
  if (current.isNotValid || newPass.isNotValid || confirm.isNotValid) {
    emit(bloc.state.copyWith(status: FormzSubmissionStatus.failure));
    return;
  }
  try {
    final success = await bloc.authRepository.changePassword(
      current.value,
      newPass.value,
    );
    emit(bloc.state.copyWith(
      status: success ?
          FormzSubmissionStatus.success : FormzSubmissionStatus.failure,
      errorMessage: success ? null : 'Failed to update password.',
    ));
  } catch (_) {
    emit(bloc.state.copyWith(
      status: FormzSubmissionStatus.failure,
      errorMessage: 'An error occurred.',
    ));
  }
}
