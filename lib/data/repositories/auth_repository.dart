import '../datasources/auth_datasource.dart';

/// Repository interface managing authentication logic and session tokens.
abstract class AuthRepository {
  /// Validates credentials and stores the session token if successful.
  Future<bool> login(String phone, String password);

  /// Retrieves the current session token if available.
  Future<String?> getToken();

  /// Clears the session token.
  Future<void> logout();
}

/// Concrete implementation of [AuthRepository] interacting with [AuthDataSource].
class AuthRepositoryImpl implements AuthRepository {
  /// Creates an [AuthRepositoryImpl] with the given [authDataSource].
  AuthRepositoryImpl({required this.authDataSource});

  /// The data source used for token persistence.
  final AuthDataSource authDataSource;

  @override
  Future<bool> login(String phone, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    // Assume any valid validation format is accepted as successful login
    final token = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';
    await authDataSource.saveToken(token);
    return true;
  }

  @override
  Future<String?> getToken() => authDataSource.readToken();

  @override
  Future<void> logout() => authDataSource.deleteToken();
}
