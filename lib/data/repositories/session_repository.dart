abstract class SessionRepository {
  Future<bool> login(String phone, String password);
  Future<String?> getToken();
  Future<void> logout();
  bool get isAuthenticated;
  bool get isInitialized;
  Future<void> init();
}

/// Domain exception for authentication failures.
class AuthDomainException implements Exception {
  final String message;
  final bool isNetworkError;
  const AuthDomainException(this.message, {this.isNetworkError = false});
}

