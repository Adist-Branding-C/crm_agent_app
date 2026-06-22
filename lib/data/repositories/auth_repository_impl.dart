import '../datasources/auth_datasource.dart';
import 'session_repository.dart';
import 'otp_repository.dart';
import 'password_repository.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl
    implements AuthRepository, SessionRepository, OtpRepository, PasswordRepository {
  AuthRepositoryImpl({required this.authDataSource});

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

  @override
  Future<void> sendOtp(String phone) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<bool> verifyOtp(String phone, String code) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return code.length == 6;
  }

  @override
  Future<bool> updatePassword(String phone, String password) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return true;
  }

  @override
  Future<bool> changePassword(String currentPassword, String newPassword) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return true;
  }
}
