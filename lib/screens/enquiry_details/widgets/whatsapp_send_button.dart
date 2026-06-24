import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../utils/whatsapp_service.dart';
import 'whatsapp_controller.dart';

/// Renders the action button to launch WhatsApp or stays disabled if empty.
class WhatsAppSendButton extends StatelessWidget {
  /// The local state controller.
  final WhatsAppController controller;

  /// Phone number of the recipient.
  final String phone;

  /// The service used to trigger url launching.
  final WhatsAppService whatsappService;

  /// Creates a [WhatsAppSendButton].
  const WhatsAppSendButton({
    super.key,
    required this.controller,
    required this.phone,
    this.whatsappService = const WhatsAppService(),
  });

  @override
  Widget build(BuildContext context) {
    final message = controller.textController.text.trim();
    final isEnabled = message.isNotEmpty;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: isEnabled
            ? () async {
                await whatsappService.launchWhatsApp(
                  phone: phone,
                  message: message,
                );
                if (context.mounted) {
                  Navigator.pop(context);
                }
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? AppColors.success : AppColors.slate300,
          disabledBackgroundColor: AppColors.slate300,
          foregroundColor: Colors.white,
          disabledForegroundColor: Colors.white.withValues(alpha: 0.6),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: const Icon(Icons.send_rounded, size: 18),
        label: Text(
          'Send on WhatsApp',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
