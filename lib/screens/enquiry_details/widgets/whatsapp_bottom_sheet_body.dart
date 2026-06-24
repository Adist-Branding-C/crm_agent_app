import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../utils/whatsapp_service.dart';
import 'whatsapp_controller.dart';
import 'whatsapp_sheet_header.dart';
import 'whatsapp_templates_list.dart';
import 'whatsapp_message_input.dart';
import 'whatsapp_send_button.dart';

class WhatsAppBottomSheetBody extends StatelessWidget {
  final Lead lead;
  final WhatsAppController controller;
  final WhatsAppService whatsappService;

  const WhatsAppBottomSheetBody({
    super.key,
    required this.lead,
    required this.controller,
    required this.whatsappService,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WhatsAppSheetHeader(name: lead.name, phone: lead.phone),
          AppSpacing.gapLg,
          WhatsAppTemplatesList(controller: controller),
          AppSpacing.gapLg,
          WhatsAppMessageInput(controller: controller),
          AppSpacing.gapXl,
          WhatsAppSendButton(
            controller: controller,
            phone: lead.phone,
            whatsappService: whatsappService,
          ),
        ],
      ),
    );
  }
}
