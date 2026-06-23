import '../datasources/auth_datasource.dart';
import 'session_repository.dart';

class SessionRepositoryImpl implements SessionRepository {
  SessionRepositoryImpl({required this.authDataSource});

  final AuthDataSource authDataSource;
  bool _isAuthenticated = false;
  bool _isInitialized = false;

  @override
  bool get isInitialized => _isInitialized;

  @override
  Future<void> init() async {
    if (_isInitialized) return;
    final token = await authDataSource.readToken();
    _isAuthenticated = token != null;
    _isInitialized = true;
  }

  @override
  bool get isAuthenticated => _isAuthenticated;

  @override
  Future<String?> getToken() => authDataSource.readToken();

  @override
  Future<bool> login(String phone, String password) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final token = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';
    await authDataSource.saveToken(token);
    _isAuthenticated = true;
    return true;
  }

  @override
  Future<void> logout() async {
    await authDataSource.deleteToken();
    _isAuthenticated = false;
  }
}