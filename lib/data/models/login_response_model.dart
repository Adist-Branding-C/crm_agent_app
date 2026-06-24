import 'package:equatable/equatable.dart';

/// Represents a user details object nested in the Login API response.
class LoginUser extends Equatable {
  /// The user's phone number.
  final String phone;

  /// The user's full name.
  final String name;

  /// Creates a [LoginUser] with the given phone and name.
  const LoginUser({required this.phone, required this.name});

  /// Parses a [LoginUser] from a JSON map.
  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      phone: json['phone'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [phone, name];
}

/// Represents the response returned by the REST Login API.
class LoginResponse extends Equatable {
  /// Indicates if the login request succeeded.
  final bool success;

  /// Explains the outcome of the request.
  final String message;

  /// The JWT authentication token.
  final String token;

  /// The authenticated user's details.
  final LoginUser user;

  /// Creates a [LoginResponse] with the given parameters.
  const LoginResponse({
    required this.success,
    required this.message,
    required this.token,
    required this.user,
  });

  /// Parses a [LoginResponse] from a JSON map.
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final success = json['success'] as bool? ?? false;
    final message = json['message'] as String? ?? '';
    final data = json['data'] as Map<String, dynamic>? ?? const {};
    final token = data['token'] as String? ?? '';
    final user = LoginUser.fromJson(
      data['user'] as Map<String, dynamic>? ?? const {},
    );
    return LoginResponse(
      success: success,
      message: message,
      token: token,
      user: user,
    );
  }

  @override
  List<Object?> get props => [success, message, token, user];
}
