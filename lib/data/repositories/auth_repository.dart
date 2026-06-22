import 'session_repository.dart';
import 'otp_repository.dart';
import 'password_repository.dart';

abstract class AuthRepository
    implements SessionRepository, OtpRepository, PasswordRepository {}
