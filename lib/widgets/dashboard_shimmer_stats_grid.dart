import 'package:flutter/material.dart';
import '../theme.dart';
import 'app_shimmer_widget.dart';

class DashboardShimmerStatsGrid extends StatelessWidget {
  const DashboardShimmerStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        2,
        (_) => Padding(
          padding:  EdgeInsets.only(bottom: AppSpacing.lg),
          child: Row(
            children: [
              Expanded(child: AppShimmerWidget.card(height: 72)),
              AppSpacing.gapWLg,
              Expanded(child: AppShimmerWidget.card(height: 72)),
            ],
          ),
        ),
      ),
    );
  }
}
