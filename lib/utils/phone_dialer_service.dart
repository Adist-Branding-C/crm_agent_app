import 'package:url_launcher/url_launcher.dart';

/// Service to handle initiating native device calls.
class PhoneDialerService {
  const PhoneDialerService();

  /// Launches the native phone dialer with the populated number.
  Future<bool> launchDialer(String phoneNumber) async {
    final cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '').trim();
    if (cleanNumber.isEmpty) return false;

    final Uri launchUri = Uri.parse('tel:$cleanNumber');
    try {
      return await launchUrl(launchUri, mode: LaunchMode.externalApplication);
    } catch (_) {
      // Fallback/exception handling
    }
    return false;
  }
}
