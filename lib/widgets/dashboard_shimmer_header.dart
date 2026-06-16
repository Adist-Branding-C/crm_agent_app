part of 'dashboard_shimmer.dart';

class _DashboardShimmerHeader extends StatelessWidget {
  const _DashboardShimmerHeader();

  @override
  Widget build(BuildContext context) {
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
}
