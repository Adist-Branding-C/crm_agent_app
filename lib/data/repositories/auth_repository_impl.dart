import '../datasources/auth_datasource.dart';
import 'auth_repository.dart';

/// Concrete implementation of [AuthRepository] interacting with [AuthDataSource].
class AuthRepositoryImpl implements AuthRepository {
  /// Creates an [AuthRepositoryImpl] with the given [authDataSource].
  AuthRepositoryImpl({required this.authDataSource});

  /// The data source used for token persistence.
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
  Future<bool> login(String phone, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    // Assume any valid validation format is accepted as successful login
    final token = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';
    await authDataSource.saveToken(token);
    _isAuthenticated = true;
    return true;
  }

  @override
  Future<String?> getToken() => authDataSource.readToken();

  @override
  Future<void> logout() async {
    await authDataSource.deleteToken();
    _isAuthenticated = false;
  }
}
