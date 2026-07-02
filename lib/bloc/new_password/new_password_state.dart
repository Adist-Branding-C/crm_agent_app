import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'new_password_inputs.dart';

enum NewPasswordFailure { none, failedToUpdate, unknown }

class NewPasswordState extends Equatable {
  final NewPassword newPassword;
  final NewConfirmPassword confirmPassword;
  final bool obscureNewPassword;
  final bool obscureConfirmPassword;
  final FormzSubmissionStatus status;
  final NewPasswordFailure? failure;

  const NewPasswordState({
    this.newPassword = const NewPassword.pure(),
    this.confirmPassword = const NewConfirmPassword.pure(),
    this.obscureNewPassword = true,
    this.obscureConfirmPassword = true,
    this.status = FormzSubmissionStatus.initial,
    this.failure,
  });

  NewPasswordState copyWith({
    NewPassword? newPassword,
    NewConfirmPassword? confirmPassword,
    bool? obscureNewPassword,
    bool? obscureConfirmPassword,
    FormzSubmissionStatus? status,
    NewPasswordFailure? failure,
    bool? clearFailure,
  }) {
    return NewPasswordState(
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      obscureNewPassword: obscureNewPassword ?? this.obscureNewPassword,
      obscureConfirmPassword:
          obscureConfirmPassword ?? this.obscureConfirmPassword,
      status: status ?? this.status,
      failure: clearFailure == true ? null : (failure ?? this.failure),
    );
  }

  @override
  List<Object?> get props => [
    newPassword,
    confirmPassword,
    obscureNewPassword,
    obscureConfirmPassword,
    status,
    failure,
  ];
}

