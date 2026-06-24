import '../datasources/auth_datasource.dart';
import '../datasources/auth_remote_datasource.dart';
import 'session_repository.dart';

class SessionRepositoryImpl implements SessionRepository {
  SessionRepositoryImpl({
    required this.authDataSource,
    required this.authRemoteDataSource,
  });

  final AuthDataSource authDataSource;
  final AuthRemoteDataSource authRemoteDataSource;
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
    final response = await authRemoteDataSource.login(phone, password);
    if (response.token.isNotEmpty) {
      await authDataSource.saveToken(response.token);
      _isAuthenticated = true;
      return true;
    }
    throw const InvalidCredentialsException();
  }

  @override
  Future<void> logout() async {
    await authDataSource.deleteToken();
    _isAuthenticated = false;
  }
}
