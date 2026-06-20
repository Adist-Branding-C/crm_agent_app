import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../utils/whatsapp_service.dart';
import 'whatsapp_controller.dart';
import 'whatsapp_bottom_sheet_body.dart';

class WhatsAppBottomSheet extends StatefulWidget {
  final Lead lead;
  final WhatsAppService whatsappService;

  const WhatsAppBottomSheet({
    super.key,
    required this.lead,
    this.whatsappService = const WhatsAppService(),
  });

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
      builder: (context, _) => TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.8, end: 1.0),
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutBack,
        builder: (context, val, child) => Transform.scale(
          scale: val,
          alignment: Alignment.bottomCenter,
          child: Opacity(opacity: ((val - 0.8) / 0.2).clamp(0.0, 1.0), child: child),
        ),
        child: WhatsAppBottomSheetBody(lead: widget.lead, controller: _controller, whatsappService: widget.whatsappService),
      ),
    );
  }
}
