import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../data/models/whatsapp_template_model.dart';

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
        margin: EdgeInsets.only(bottom: AppSpacing.md),
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? AppColors.success : AppColors.borderLight,
            width: isSelected ? 2.w : 1.w,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(right: isSelected ? 24.0.w : 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    template.title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                      fontSize: 13.5.s
                    ),
                  ),
                  AppSpacing.gapXs,
                  Text(
                    template.contentTemplate,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 12.s
                      
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
               Positioned(
                top: 0,
                right: 0,
                child: Icon(
                  Icons.check_circle,
                  color: AppColors.success,
                  size: 20.s,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
