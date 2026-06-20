import 'package:flutter/material.dart';
import '../../../theme.dart';
import 'whatsapp_template_model.dart';

class WhatsAppTemplateCard extends StatelessWidget {
  final WhatsAppTemplateModel template;
  final bool isSelected;
  final VoidCallback onTap;

  const WhatsAppTemplateCard({
    super.key,
    required this.template,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.success : AppColors.borderLight,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: AppColors.success.withValues(alpha: 0.08), blurRadius: 8, offset: Offset(0, 2))]
              : AppTheme.cardShadow,
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(right: isSelected ? 24.0 : 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(template.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                  const SizedBox(height: 6),
                  Text(template.contentTemplate, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, color: AppColors.textMuted, height: 1.4)),
                ],
              ),
            ),
            if (isSelected)
              const Positioned(top: 0, right: 0, child: Icon(Icons.check_circle, color: AppColors.success, size: 20)),
          ],
        ),
      ),
    );
  }
}
