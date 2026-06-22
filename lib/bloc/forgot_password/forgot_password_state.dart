part of 'forgot_password_bloc.dart';

/// State representation of the Forgot Password flow.
class ForgotPasswordState extends Equatable {
  final ForgotPasswordPhone phone;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  const ForgotPasswordState({
    this.phone = const ForgotPasswordPhone.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  /// Factory method to copy state with modified fields.
  ForgotPasswordState copyWith({
    ForgotPasswordPhone? phone,
    FormzSubmissionStatus? status,
    String? errorMessage,
  }) {
    return ForgotPasswordState(
      phone: phone ?? this.phone,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [phone, status, errorMessage];
}
