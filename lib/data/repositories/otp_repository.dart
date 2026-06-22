abstract class OtpRepository {
  Future<void> sendOtp(String phone);
  Future<bool> verifyOtp(String phone, String code);
}
