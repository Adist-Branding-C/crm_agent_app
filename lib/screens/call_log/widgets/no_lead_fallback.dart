import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/screen_header.dart';

/// Fallback widget displayed when no valid lead is provided for call logging.
class NoLeadCallLogFallback extends StatelessWidget {
  const NoLeadCallLogFallback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: const SafeArea(
        child: Column(
          children: [
            ScreenHeader(title: 'Log Call', showBackButton: true),
            Expanded(
              child: Center(
                child: Text(
                  'No valid lead provided for call logging.',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
