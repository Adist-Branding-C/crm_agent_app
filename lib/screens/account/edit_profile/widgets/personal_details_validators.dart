class PersonalDetailsValidators {
  PersonalDetailsValidators._();

  static String? requiredField(String? val, String fieldName) {
    if (val == null || val.trim().isEmpty) return '$fieldName is required';
    return null;
  }

  static String? phone(String? val) {
    final error = requiredField(val, 'Phone number');
    if (error != null) return error;
    if (!RegExp(r'^\+?[0-9\s\-]{7,15}$').hasMatch(val!.trim())) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? email(String? val) {
    if (val == null || val.trim().isEmpty) return null;
    final clean = val.trim();
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(clean)) {
      return 'Enter a valid email address';
    }
    return null;
  }
}
