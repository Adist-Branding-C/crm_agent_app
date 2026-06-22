abstract class PasswordRepository {
  Future<bool> updatePassword(String phone, String password);
  Future<bool> changePassword(String currentPassword, String newPassword);
}
