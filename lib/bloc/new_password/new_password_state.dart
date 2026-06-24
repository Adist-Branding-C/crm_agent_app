import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'new_password_inputs.dart';

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
