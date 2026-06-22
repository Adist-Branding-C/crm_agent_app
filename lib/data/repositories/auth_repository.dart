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

  /// Sends a 6-digit OTP code to the registered mobile number.
  Future<void> sendOtp(String phone);

  /// Verifies the 6-digit OTP code sent to the phone.
  Future<bool> verifyOtp(String phone, String code);

  /// Updates the user's password.
  Future<bool> updatePassword(String phone, String password);

  /// Changes the authenticated user's password.
  Future<bool> changePassword(String currentPassword, String newPassword);
}
