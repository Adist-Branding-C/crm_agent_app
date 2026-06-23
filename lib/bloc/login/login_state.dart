import 'package:equatable/equatable.dart';
import 'login_inputs.dart';

class LoginState extends Equatable {
  const LoginState({
    this.phone = const LoginPhone.pure(),
    this.password = const LoginPassword.pure(),
    this.obscurePassword = true,
    this.isSubmitted = false,
    this.isSuccess = false,
    this.authFailure,
  });

  final LoginPhone phone;
  final LoginPassword password;
  final bool obscurePassword;
  final bool isSubmitted;
  final bool isSuccess;
  final AuthFailure? authFailure;

  LoginState copyWith({
    LoginPhone? phone,
    LoginPassword? password,
    bool? obscurePassword,
    bool? isSubmitted,
    bool? isSuccess,
    AuthFailure? authFailure,
    bool? clearAuthFailure,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      isSuccess: isSuccess ?? this.isSuccess,
      authFailure: clearAuthFailure == true ? null : (authFailure ?? this.authFailure),
    );
  }

  @override
  List<Object?> get props => [phone, password, obscurePassword, isSubmitted, isSuccess, authFailure];
}

