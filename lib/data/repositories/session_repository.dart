abstract class SessionRepository {
  Future<bool> login(String phone, String password);
  Future<String?> getToken();
  Future<void> logout();
  bool get isAuthenticated;
  bool get isInitialized;
  Future<void> init();
}
