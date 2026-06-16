part of 'dashboard_shimmer.dart';

class _DashboardShimmerListSection extends StatelessWidget {
  const _DashboardShimmerListSection();

  @override
  Widget build(BuildContext context) {
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
