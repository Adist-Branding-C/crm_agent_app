/// Repository interface managing authentication logic and session tokens.
abstract class AuthRepository {
  /// Validates credentials and stores the session token if successful.
  Future<bool> login(String phone, String password);

  /// Retrieves the current session token if available.
  Future<String?> getToken();

  /// Clears the session token.
  Future<void> logout();

  /// Returns whether the user is currently authenticated.
  bool get isAuthenticated;

  /// Returns whether the repository has finished initialization.
  bool get isInitialized;

  /// Initializes the repository by reading stored credentials/tokens.
  Future<void> init();
}
