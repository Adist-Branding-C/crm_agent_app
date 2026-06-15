import 'package:flutter/material.dart';
import '../../../widgets/screen_header.dart';

/// Header widget for the Analytics screen with a back button and titles.
class AnalyticsHeader extends StatelessWidget {
  /// Creates a constant [AnalyticsHeader].
  const AnalyticsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenHeader(
      title: 'Analytics',
      subtitle: 'This month',
      showBackButton: true,
    );
  }
}
