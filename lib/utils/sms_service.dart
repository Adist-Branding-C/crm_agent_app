import 'package:url_launcher/url_launcher.dart';

/// Service to handle launching native SMS intents.
class SmsService {
  /// Creates a constant [SmsService].
  const SmsService();

  /// Launches the native SMS composer populated with the number.
  Future<bool> launchSms(String phoneNumber) async {
    final cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '').trim();
    if (cleanNumber.isEmpty) return false;

    final Uri launchUri = Uri.parse('sms:$cleanNumber');
    try {
      return await launchUrl(launchUri, mode: LaunchMode.externalApplication);
    } catch (_) {
      // Fallback/exception handling
    }
    return false;
  }
}
