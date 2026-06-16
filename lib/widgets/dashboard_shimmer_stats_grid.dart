part of 'dashboard_shimmer.dart';

class _DashboardShimmerStatsGrid extends StatelessWidget {
  const _DashboardShimmerStatsGrid();

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
