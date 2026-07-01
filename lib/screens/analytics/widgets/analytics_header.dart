import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/analytics/analytics_bloc.dart';
import '../../../widgets/screen_header.dart';
import 'analytics_filter_sheet.dart';
import '../../../theme.dart';

import 'filter_button.dart';

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
          padding: EdgeInsets.fromLTRB(17.0.w, 40.0.h, 17.0.w, 13.0.h),
          subtitle: period,
          showBackButton: true,
          actions: const FilterButton(),
        );
      },
    );
  }
}


void openAnalyticsFilter({required BuildContext context}){
  showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.transparent,
          builder: (_) => BlocProvider.value(
            value: context.read<AnalyticsBloc>(),
            child: const AnalyticsFilterSheet(),
          ),
        );
}