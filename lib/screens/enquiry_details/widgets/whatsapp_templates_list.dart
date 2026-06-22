import 'package:flutter/material.dart';
import '../../../data/repositories/whatsapp_template_repository.dart';
import '../../../theme.dart';
import 'whatsapp_controller.dart';
import 'whatsapp_template_card.dart';

/// Renders the section headers and list of selectable templates.
class WhatsAppTemplatesList extends StatelessWidget {
  /// The local state controller.
  final WhatsAppController controller;

  /// Creates a constant [WhatsAppTemplatesList].
  const WhatsAppTemplatesList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final templates = const WhatsAppTemplateRepository().getTemplates();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'QUICK MESSAGES',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
                color: AppColors.textMuted,
              ),
            ),
            InkWell(
              onTap: () => controller.selectCustomWrite(),
              child: const Row(
                children: [
                  Icon(Icons.edit, size: 14, color: AppColors.textMuted),
                  SizedBox(width: 4),
                  Text(
                    'Write your own',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 230,
          child: ListView.builder(
            itemCount: templates.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final template = templates[index];
              final isSelected = controller.selectedTemplate == template;
              return WhatsAppTemplateCard(
                template: template,
                isSelected: isSelected,
                onTap: () => controller.selectTemplate(template),
              );
            },
          ),
        ),
      ],
    );
  }
}
