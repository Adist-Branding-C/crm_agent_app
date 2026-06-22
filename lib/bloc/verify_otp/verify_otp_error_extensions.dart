enum VerifyOtpFailure { resend, incorrectCode, unknown }

extension VerifyOtpFailureMessage on VerifyOtpFailure {
  String get message => switch (this) {
    VerifyOtpFailure.resend => 'Failed to resend OTP.',
    VerifyOtpFailure.incorrectCode => 'Incorrect code.',
    VerifyOtpFailure.unknown => 'An unexpected error occurred.',
  };
}
