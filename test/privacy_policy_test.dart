import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/screens/privacy_policy/privacy_policy_screen.dart';

void main() {
  testWidgets('Privacy Policy Screen renders content successfully', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      SfsInitBuilder(
        mobileSize: const Size(360, 690),
        tabletSize: const Size(481, 890),
        desktopSize: const Size(1420, 820),
        respectSystemTextScale: true,
        orientationAware: true,
        builder: (context, child) =>
            const MaterialApp(home: PrivacyPolicyScreen()),
      ),
    );
    await tester.pumpAndSettle();

    // Verify Title
    expect(find.text('Privacy Policy'), findsOneWidget);

    // Verify Section Headers & Key Content
    expect(find.text('1. Introduction'), findsOneWidget);
    expect(find.text('Effective Date: June 30, 2026'), findsOneWidget);
    expect(find.text('6. Your Rights and Account Deletion'), findsOneWidget);
    expect(find.textContaining('support@yourcrm.com'), findsAtLeastNWidgets(1));
  });
}
