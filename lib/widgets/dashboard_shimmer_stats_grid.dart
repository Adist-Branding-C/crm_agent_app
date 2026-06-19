import 'package:flutter/material.dart';
import 'app_shimmer_widget.dart';

class DashboardShimmerStatsGrid extends StatelessWidget {
  const DashboardShimmerStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        2,
        (_) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              Expanded(child: AppShimmerWidget.card(height: 72)),
              const SizedBox(width: 16),
              Expanded(child: AppShimmerWidget.card(height: 72)),
            ],
          ),
        ),
      ),
    );
  }
}
