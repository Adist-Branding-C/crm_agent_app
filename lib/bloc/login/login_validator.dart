/// Validation helper for the Login BLoC.
class LoginValidator {
  LoginValidator._();

  /// Validates the phone number format and length.
  static String? validatePhone(String phone) {
    if (phone.isEmpty) {
      return 'Phone number is required.';
    }
    final regExp = RegExp(r'^\+?[0-9]*$');
    if (!regExp.hasMatch(phone)) {
      return 'Phone number must contain only digits.';
    }
    final digitCount = phone.replaceAll(RegExp(r'[^0-9]'), '').length;
    if (digitCount < 10) {
      return 'Phone number must be at least 10 digits.';
    }
    return null;
  }

  /// Validates password constraints.
  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required.';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters.';
    }
    return null;
  }
}
