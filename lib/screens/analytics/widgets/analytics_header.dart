import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/analytics/analytics_bloc.dart';
import '../../../widgets/screen_header.dart';
import '../../../theme/app_colors.dart';
import 'analytics_filter_sheet.dart';

class AnalyticsHeader extends StatelessWidget {
  const AnalyticsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticsBloc, AnalyticsState>(
      buildWhen: (prev, curr) =>
          prev.runtimeType != curr.runtimeType ||
          (curr is AnalyticsLoaded &&
              (prev as AnalyticsLoaded?)?.selectedPeriod != curr.selectedPeriod),
      builder: (context, state) {
        final period = state is AnalyticsLoaded ? state.selectedPeriod : 'This Month';
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
          backgroundColor: Colors.transparent,
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.filter_alt_outlined, size: 16, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              'Filter',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
