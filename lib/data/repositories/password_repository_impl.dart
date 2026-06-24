import 'password_repository.dart';

class PasswordRepositoryImpl implements PasswordRepository {
  @override
  Future<bool> updatePassword(String phone, String password) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return true;
  }

  @override
  Future<bool> changePassword(
    String currentPassword,
    String newPassword,
  ) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return true;
  }
}
