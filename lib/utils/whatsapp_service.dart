import 'package:url_launcher/url_launcher.dart';

/// Service to handle launching WhatsApp messages.
class WhatsAppService {
  /// Creates a constant [WhatsAppService].
  const WhatsAppService();

  /// Launches WhatsApp web/app with pre-filled number and message.
  Future<bool> launchWhatsApp({
    required String phone,
    required String message,
  }) async {
    final cleanPhone = phone.replaceAll(RegExp(r'[^\d]'), '').trim();
    if (cleanPhone.isEmpty) return false;

    final uri = Uri.parse(
      'https://wa.me/$cleanPhone?text=${Uri.encodeComponent(message)}',
    );

    try {
      return await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      // Fallback or error logging
    }
    return false;
  }
}
