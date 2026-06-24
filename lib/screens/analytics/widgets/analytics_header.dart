import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/analytics/analytics_bloc.dart';
import '../../../widgets/screen_header.dart';
import 'analytics_filter_sheet.dart';
import '../../../theme.dart';

class AnalyticsHeader extends StatelessWidget {
  const AnalyticsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticsBloc, AnalyticsState>(
      buildWhen: (prev, curr) =>
          prev.runtimeType != curr.runtimeType ||
          (prev is AnalyticsLoaded &&
              curr is AnalyticsLoaded &&
              prev.selectedPeriod != curr.selectedPeriod),
      builder: (context, state) {
        final period = state is AnalyticsLoaded
            ? state.selectedPeriod
            : 'This Month';
        return ScreenHeader(
          title: 'Analytics',
          subtitle: period,
          showBackButton: true,
          actions: const _FilterButton(),
        );
      },
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.transparent,
          builder: (_) => BlocProvider.value(
            value: context.read<AnalyticsBloc>(),
            child: const AnalyticsFilterSheet(),
          ),
        );
      },
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.filter_alt_outlined,
              size: 16,
              color: AppColors.surfaceWhite,
            ),
            AppSpacing.gapWSm,
            Text(
              'Filter',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.surfaceWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
