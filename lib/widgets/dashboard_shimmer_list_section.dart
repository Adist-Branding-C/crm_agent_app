import 'package:flutter/material.dart';
import '../theme.dart';
import 'app_shimmer_widget.dart';

class DashboardShimmerListSection extends StatelessWidget {
  const DashboardShimmerListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppShimmerWidget(width: 120, height: 18, borderRadius: 4),
        AppSpacing.gapMd,
        AppShimmerWidget.card(height: 150),
      ],
    );
  }
}
