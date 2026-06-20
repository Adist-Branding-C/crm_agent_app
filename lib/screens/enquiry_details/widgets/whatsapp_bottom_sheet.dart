import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../utils/whatsapp_service.dart';
import 'whatsapp_controller.dart';
import 'whatsapp_sheet_header.dart';
import 'whatsapp_templates_list.dart';
import 'whatsapp_message_input.dart';
import 'whatsapp_send_button.dart';

/// The main bottom sheet modal container.
class WhatsAppBottomSheet extends StatefulWidget {
  /// The sales lead details.
  final Lead lead;

  /// The service used to trigger url launching.
  final WhatsAppService whatsappService;

  /// Creates a constant [WhatsAppBottomSheet].
  const WhatsAppBottomSheet({
    super.key,
    required this.lead,
    this.whatsappService = const WhatsAppService(),
  });

  /// Launches the bottom sheet using a custom ease-out transition.
  static void show(
    BuildContext context, {
    required Lead lead,
    WhatsAppService whatsappService = const WhatsAppService(),
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => WhatsAppBottomSheet(
        lead: lead,
        whatsappService: whatsappService,
      ),
    );
  }

  @override
  State<WhatsAppBottomSheet> createState() => _WhatsAppBottomSheetState();
}

class _WhatsAppBottomSheetState extends State<WhatsAppBottomSheet> {
  late final WhatsAppController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WhatsAppController(recipientName: widget.lead.name);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, child) => TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.8, end: 1.0),
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutBack,
        builder: (context, val, child) => Transform.scale(
          scale: val,
          alignment: Alignment.bottomCenter,
          child: Opacity(
            opacity: ((val - 0.8) / 0.2).clamp(0.0, 1.0),
            child: child,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WhatsAppSheetHeader(
                name: widget.lead.name,
                phone: widget.lead.phone,
              ),
              const SizedBox(height: 16),
              WhatsAppTemplatesList(controller: _controller),
              const SizedBox(height: 16),
              WhatsAppMessageInput(controller: _controller),
              const SizedBox(height: 20),
              WhatsAppSendButton(
                controller: _controller,
                phone: widget.lead.phone,
                whatsappService: widget.whatsappService,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
