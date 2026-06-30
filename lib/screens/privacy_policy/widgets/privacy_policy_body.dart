import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/responsive_width_container.dart';
import '../data/policy_data_p1.dart';
import '../data/policy_data_p2.dart';
import 'privacy_policy_card.dart';

/// The scrollable body layout of the Privacy Policy page.
class PrivacyPolicyBody extends StatelessWidget {
  /// Creates a [PrivacyPolicyBody].
  const PrivacyPolicyBody({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = [...privacySectionsPart1, ...privacySectionsPart2];

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, AppSpacing.xl),
      child: Center(
        child: ResponsiveWidthContainer(
          maxWidth: 540.w,
          child: Column(
            children: [
              ...sections.map((section) {
                return Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.sm),
                  child: PrivacyPolicyCard(section: section),
                );
              }),
              AppSpacing.gapLg,
               Center(
                child: Text(
                  'Last Updated: June 30, 2026',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 9.s),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
