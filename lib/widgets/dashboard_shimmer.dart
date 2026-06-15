import 'package:flutter/material.dart';
import 'app_shimmer_widget.dart';

/// Full-screen skeleton shimmer loader for the Dashboard.
class DashboardShimmer extends StatelessWidget {
  /// Creates a constant [DashboardShimmer].
  const DashboardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildStatsGrid(),
          const SizedBox(height: 24),
          _buildListSection(),
          const SizedBox(height: 24),
          _buildListSection(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppShimmerWidget(width: 150, height: 28, borderRadius: 6),
            const SizedBox(height: 8),
            const AppShimmerWidget(width: 100, height: 14, borderRadius: 4),
          ],
        ),
        const Row(
          children: [
            AppShimmerWidget(width: 40, height: 40, borderRadius: 12),
            SizedBox(width: 12),
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

  Widget _buildStatsGrid() {
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

  Widget _buildListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppShimmerWidget(width: 120, height: 18, borderRadius: 4),
        const SizedBox(height: 12),
        AppShimmerWidget.card(height: 150),
      ],
    );
  }
}
