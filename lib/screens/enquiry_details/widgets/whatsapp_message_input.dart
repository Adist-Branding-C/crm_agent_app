import 'package:flutter/material.dart';
import '../../../theme.dart';
import 'whatsapp_controller.dart';

/// Renders the message text area.
class WhatsAppMessageInput extends StatelessWidget {
  /// The local state controller.
  final WhatsAppController controller;

  /// Creates a constant [WhatsAppMessageInput].
  const WhatsAppMessageInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final hasSelected = controller.selectedTemplate != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MESSAGE',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller.textController,
          maxLines: 4,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textDark,
          ),
          decoration: InputDecoration(
            hintText: 'Tap a quick message above, or type your own...',
            hintStyle: const TextStyle(color: AppColors.textMuted),
            contentPadding: const EdgeInsets.all(12),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: hasSelected ? AppColors.success : AppColors.borderLight,
                width: hasSelected ? 2 : 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.success,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
