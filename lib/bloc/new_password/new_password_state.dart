part of 'new_password_bloc.dart';

/// State representation of the New Password flow.
class NewPasswordState extends Equatable {
  final NewPassword newPassword;
  final NewConfirmPassword confirmPassword;
  final bool obscureNewPassword;
  final bool obscureConfirmPassword;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  const NewPasswordState({
    this.newPassword = const NewPassword.pure(),
    this.confirmPassword = const NewConfirmPassword.pure(),
    this.obscureNewPassword = true,
    this.obscureConfirmPassword = true,
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  /// Factory method to copy state with modified fields.
  NewPasswordState copyWith({
    NewPassword? newPassword,
    NewConfirmPassword? confirmPassword,
    bool? obscureNewPassword,
    bool? obscureConfirmPassword,
    FormzSubmissionStatus? status,
    String? errorMessage,
  }) {
    return NewPasswordState(
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      obscureNewPassword: obscureNewPassword ?? this.obscureNewPassword,
      obscureConfirmPassword:
          obscureConfirmPassword ?? this.obscureConfirmPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        newPassword,
        confirmPassword,
        obscureNewPassword,
        obscureConfirmPassword,
        status,
        errorMessage,
      ];
}
