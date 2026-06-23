import '../datasources/auth_datasource.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authDataSource});

  final AuthDataSource authDataSource;

  @override
  Future<bool> login(String phone, String password) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final token = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';
    await authDataSource.saveToken(token);
    return true;
  }

  @override
  Future<void> logout() async {
    await authDataSource.deleteToken();
  }
}
