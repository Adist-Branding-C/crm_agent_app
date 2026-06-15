part of 'login_bloc.dart';

/// Represents the state of the Login Screen.
///
/// Holds the input values, validation errors, obscurity settings, and outcomes.
class LoginState extends Equatable {
  /// Creates a [LoginState] configuration.
  const LoginState({
    this.phone = '',
    this.password = '',
    this.obscurePassword = true,
    this.phoneError,
    this.passwordError,
    this.isSuccess = false,
  });

  /// The phone number value input by the user.
  final String phone;

  /// The password value input by the user.
  final String password;

  /// True if the password input text should be masked.
  final bool obscurePassword;

  /// Specific validation error for the phone number field.
  final String? phoneError;

  /// Specific validation error for the password field.
  final String? passwordError;

  /// True if authentication was successful.
  final bool isSuccess;

  /// Returns a copy of the state with modified fields.
  LoginState copyWith({
    String? phone,
    String? password,
    bool? obscurePassword,
    String? phoneError,
    String? passwordError,
    bool? clearPhoneError,
    bool? clearPasswordError,
    bool? isSuccess,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      phoneError: clearPhoneError == true
          ? null
          : (phoneError ?? this.phoneError),
      passwordError: clearPasswordError == true
          ? null
          : (passwordError ?? this.passwordError),
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [
    phone,
    password,
    obscurePassword,
    phoneError,
    passwordError,
    isSuccess,
  ];
}
