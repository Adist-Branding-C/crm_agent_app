part of 'change_password_bloc.dart';

/// State representation of the Change Password flow.
class ChangePasswordState extends Equatable {
  final ChangeCurrentPassword currentPassword;
  final ChangeNewPassword newPassword;
  final ChangeConfirmPassword confirmPassword;
  final bool obscureCurrentPassword;
  final bool obscureNewPassword;
  final bool obscureConfirmPassword;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  const ChangePasswordState({
    this.currentPassword = const ChangeCurrentPassword.pure(),
    this.newPassword = const ChangeNewPassword.pure(),
    this.confirmPassword = const ChangeConfirmPassword.pure(),
    this.obscureCurrentPassword = true,
    this.obscureNewPassword = true,
    this.obscureConfirmPassword = true,
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  /// Factory method to copy state with modified fields.
  ChangePasswordState copyWith({
    ChangeCurrentPassword? currentPassword,
    ChangeNewPassword? newPassword,
    ChangeConfirmPassword? confirmPassword,
    bool? obscureCurrentPassword,
    bool? obscureNewPassword,
    bool? obscureConfirmPassword,
    FormzSubmissionStatus? status,
    String? errorMessage,
  }) {
    return ChangePasswordState(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      obscureCurrentPassword: obscureCurrentPassword ?? this.obscureCurrentPassword,
      obscureNewPassword: obscureNewPassword ?? this.obscureNewPassword,
      obscureConfirmPassword: obscureConfirmPassword ?? this.obscureConfirmPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        currentPassword,
        newPassword,
        confirmPassword,
        obscureCurrentPassword,
        obscureNewPassword,
        obscureConfirmPassword,
        status,
        errorMessage,
      ];
}
