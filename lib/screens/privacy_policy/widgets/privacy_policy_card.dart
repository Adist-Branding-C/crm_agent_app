import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import '../data/privacy_policy_model.dart';

/// Card displaying a single section of the privacy policy.
class PrivacyPolicyCard extends StatelessWidget {
  /// The section data to display.
  final PrivacyPolicySection section;

  /// Creates a [PrivacyPolicyCard].
  const PrivacyPolicyCard({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.bold,
      color: AppColors.textDark,
    );

    final bodyStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: AppColors.textMuted,
          height: 1.4,
        );

    return CustomCard(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(section.title, style: titleStyle),
          AppSpacing.gapMd,
          ...section.bulletPoints.map((point) {
            final isBullet = point.startsWith('To ') || point.contains(':');
            return Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isBullet) ...[
                    Padding(
                      padding: EdgeInsets.only(top: 8.h, right: 8.w),
                      child: Container(
                        width: 4.w,
                        height: 4.w,
                        decoration: const BoxDecoration(
                          color: AppColors.textDark,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                  Expanded(child: Text(point, style: bodyStyle)),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
