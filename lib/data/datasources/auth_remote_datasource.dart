import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import '../models/login_response_model.dart';

/// Thrown when a network connectivity issue occurs.
class NetworkException implements Exception {
  final String message;
  const NetworkException([this.message = 'Network connectivity issue.']);
}

/// Thrown when the login credentials (phone/password) are invalid.
class InvalidCredentialsException implements Exception {
  final String message;
  const InvalidCredentialsException([this.message = 'Invalid credentials.']);
}

/// Remote data source interface for authentication.
abstract class AuthRemoteDataSource {
  /// Authenticates a user with phone and password.
  Future<LoginResponse> login(String phone, String password);
}

/// Implementation of [AuthRemoteDataSource] using [Dio].
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  static const _url = 'https://crm-mock-api.onrender.com/api/login';

  /// Creates an [AuthRemoteDataSourceImpl] with an optional custom [Dio] client.
  AuthRemoteDataSourceImpl({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<LoginResponse> login(String phone, String password) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        _url,
        data: {'phone': phone, 'password': password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      final data = response.data;
      if (data == null) {
        throw const NetworkException('Empty response from login server.');
      }
      developer.log('Login API Response: $data');
    

      final loginResponse = LoginResponse.fromJson(data);
      if (!loginResponse.success) {
        throw InvalidCredentialsException(
          loginResponse.message.isNotEmpty
              ? loginResponse.message
              : 'Invalid credentials.',
        );
      }
      if (response.statusCode != 200) {
      
        throw InvalidCredentialsException(loginResponse.message);
      }
      developer.log('returning login response: $loginResponse');
      return loginResponse;
    } on DioException catch (e) {
      final status = e.response?.statusCode;
     
      if (status == 400) {
        final body = e.response?.data;
        final msg = (body is Map) ? body['message'] as String? : null;
        throw InvalidCredentialsException(msg ?? 'Missing fields.');
      }
      throw NetworkException('Network error: ${e.message}');
    }
  }
}
