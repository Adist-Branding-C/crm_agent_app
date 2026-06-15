/// Data source interface for handling authentication tokens and credential checks.
abstract class AuthDataSource {
  /// Simulates saving an authentication token.
  Future<void> saveToken(String token);

  /// Simulates reading the stored authentication token.
  Future<String?> readToken();

  /// Simulates deleting the stored authentication token.
  Future<void> deleteToken();
}

/// In-memory implementation of [AuthDataSource] for mocking token operations.
class AuthDataSourceImpl implements AuthDataSource {
  String? _token;

  @override
  Future<void> saveToken(String token) async {
    _token = token;
  }

  @override
  Future<String?> readToken() async {
    return _token;
  }

  @override
  Future<void> deleteToken() async {
    _token = null;
  }
}
