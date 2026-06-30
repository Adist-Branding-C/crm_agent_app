import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import 'widgets/privacy_policy_body.dart';

/// Screen displaying the application's Privacy Policy.
class PrivacyPolicyScreen extends StatelessWidget {
  /// Creates a [PrivacyPolicyScreen].
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ScreenHeader(
            title: 'Privacy Policy',
            showBackButton: true,
            padding: EdgeInsets.fromLTRB(17.0.w, 20.0.h, 17.0.w, 13.0.h),
          ),
          const Expanded(child: PrivacyPolicyBody()),
        ],
      ),
    );
  }
}
