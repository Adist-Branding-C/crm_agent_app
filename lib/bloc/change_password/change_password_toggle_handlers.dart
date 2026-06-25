import 'package:flutter_bloc/flutter_bloc.dart';
import 'change_password_bloc.dart';

void changePasswordToggleCurrentVisibility(
  ChangePasswordBloc bloc,
  Emitter<ChangePasswordState> emit,
) => emit(
  bloc.state.copyWith(
    obscureCurrentPassword: !bloc.state.obscureCurrentPassword,
  ),
);

void changePasswordToggleNewVisibility(
  ChangePasswordBloc bloc,
  Emitter<ChangePasswordState> emit,
) => emit(
  bloc.state.copyWith(obscureNewPassword: !bloc.state.obscureNewPassword),
);

void changePasswordToggleConfirmVisibility(
  ChangePasswordBloc bloc,
  Emitter<ChangePasswordState> emit,
) => emit(
  bloc.state.copyWith(
    obscureConfirmPassword: !bloc.state.obscureConfirmPassword,
  ),
);
