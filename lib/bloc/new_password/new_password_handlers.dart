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
      clearFailure: true,
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
      clearFailure: true,
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
