import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'new_password_bloc.dart';

void newPasswordChanged(
  NewPasswordBloc bloc,
  NewPasswordChanged e,
  Emitter<NewPasswordState> emit,
) {
  final password = NewPassword.dirty(e.password);
  final confirm = NewConfirmPassword.dirty(
    password: password.value,
    value: bloc.state.confirmPassword.value,
  );
  emit(
    bloc.state.copyWith(
      newPassword: password,
      confirmPassword: confirm,
      status: FormzSubmissionStatus.initial,
      errorMessage: null,
    ),
  );
}

void newConfirmPasswordChanged(
  NewPasswordBloc bloc,
  NewConfirmPasswordChanged e,
  Emitter<NewPasswordState> emit,
) {
  final confirm = NewConfirmPassword.dirty(
    password: bloc.state.newPassword.value,
    value: e.confirmPassword,
  );
  emit(
    bloc.state.copyWith(
      confirmPassword: confirm,
      status: FormzSubmissionStatus.initial,
      errorMessage: null,
    ),
  );
}

void newToggleNewPasswordVisibility(
  NewPasswordBloc bloc,
  Emitter<NewPasswordState> emit,
) => emit(
  bloc.state.copyWith(obscureNewPassword: !bloc.state.obscureNewPassword),
);

void newToggleConfirmPasswordVisibility(
  NewPasswordBloc bloc,
  Emitter<NewPasswordState> emit,
) => emit(
  bloc.state.copyWith(
    obscureConfirmPassword: !bloc.state.obscureConfirmPassword,
  ),
);

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
        errorMessage: ok ? null : 'Failed to update password.',
      ),
    );
  } catch (_) {
    emit(
      bloc.state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: 'An error occurred.',
      ),
    );
  }
}
