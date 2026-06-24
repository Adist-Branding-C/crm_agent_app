import 'otp_repository.dart';

class OtpRepositoryImpl implements OtpRepository {
  @override
  Future<void> sendOtp(String phone) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<bool> verifyOtp(String phone, String code) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return code.length == 6;
  }
}
