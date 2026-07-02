import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'new_password_bloc.dart';

Future<void> newPasswordSubmitted(
  NewPasswordBloc bloc,
  NewPasswordSubmitted e,
  Emitter<NewPasswordState> emit,
) async {
  final password = NewPassword.dirty(bloc.state.newPassword.value);
  final confirm = NewConfirmPassword.dirty(
    password: password.value,
    value: bloc.state.confirmPassword.value,
  );
  emit(
    bloc.state.copyWith(
      newPassword: password,
      confirmPassword: confirm,
      status: FormzSubmissionStatus.inProgress,
    ),
  );
  if (password.isNotValid || confirm.isNotValid) {
    emit(bloc.state.copyWith(status: FormzSubmissionStatus.failure));
    return;
  }
  try {
    final ok = await bloc.authRepository.updatePassword(
      bloc.phone,
      password.value,
    );
    emit(
      bloc.state.copyWith(
        status: ok
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure,
        failure: ok ? null : NewPasswordFailure.failedToUpdate,
      ),
    );
  } catch (_) {
    emit(
      bloc.state.copyWith(
        status: FormzSubmissionStatus.failure,
        failure: NewPasswordFailure.unknown,
      ),
    );
  }
}
