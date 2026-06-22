part of 'change_password_bloc.dart';

extension ChangePasswordToggleHandlers on ChangePasswordBloc {
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
}
