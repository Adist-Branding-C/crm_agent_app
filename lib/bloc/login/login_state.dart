part of 'login_bloc.dart';

/// Represents the state of the Login Screen.
///
/// Holds the input values, validation errors, obscurity settings, and outcomes.
class LoginState extends Equatable {
  /// Creates a [LoginState] configuration.
  const LoginState({
    this.phone = const LoginPhone.pure(),
    this.password = const LoginPassword.pure(),
    this.obscurePassword = true,
    this.isSubmitted = false,
    this.isSuccess = false,
    this.authFailure,
  });

  /// The phone number value input by the user.
  final LoginPhone phone;

  /// The password value input by the user.
  final LoginPassword password;

  /// True if the password input text should be masked.
  final bool obscurePassword;

  /// True if the form has been submitted.
  final bool isSubmitted;

  /// True if authentication was successful.
  final bool isSuccess;

  /// Authentication failure type from API submission if any.
  final AuthFailure? authFailure;

  /// Returns a copy of the state with modified fields.
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
      authFailure: clearAuthFailure == true
          ? null
          : (authFailure ?? this.authFailure),
    );
  }

  @override
  List<Object?> get props => [
        phone,
        password,
        obscurePassword,
        isSubmitted,
        isSuccess,
        authFailure,
      ];
}

