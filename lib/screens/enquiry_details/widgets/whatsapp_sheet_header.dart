import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../theme.dart';

/// The header component of the WhatsApp bottom sheet.
class WhatsAppSheetHeader extends StatelessWidget {
  /// Name of the recipient contact.
  final String name;

  /// Phone number of the recipient.
  final String phone;

  /// Creates a constant [WhatsAppSheetHeader].
  const WhatsAppSheetHeader({
    super.key,
    required this.name,
    required this.phone,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: AppSpacing.sm, bottom: AppSpacing.lg),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.slate300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.successBackground,
                shape: BoxShape.circle,
              ),
              child: const FaIcon(
                FontAwesomeIcons.whatsapp,
                color: AppColors.success,
                size: 20,
              ),
            ),
            AppSpacing.gapWMd,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Send a message',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  AppSpacing.gapXxs,
                  Text(
                    'To $name · $phone',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
