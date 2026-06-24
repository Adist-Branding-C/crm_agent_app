import 'package:flutter/material.dart';
import '../theme.dart';
import 'app_shimmer_widget.dart';

class DashboardShimmerHeader extends StatelessWidget {
  const DashboardShimmerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppShimmerWidget(width: 150, height: 28, borderRadius: 6),
            AppSpacing.gapSm,
            const AppShimmerWidget(width: 100, height: 14, borderRadius: 4),
          ],
        ),
        const Row(
          children: [
            AppShimmerWidget(width: 40, height: 40, borderRadius: 12),
            AppSpacing.gapWMd,
            AppShimmerWidget(
              width: 40,
              height: 40,
              borderRadius: 20,
              shape: BoxShape.circle,
            ),
          ],
        ),
      ],
    );
  }
}
