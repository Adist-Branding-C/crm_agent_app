import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/deals/deals_bloc.dart';
import '../../../../utils/currency_formatter.dart';
import '../../../../widgets/screen_header.dart';
import '../../../../theme.dart';

/// Header widget for the Deals screen showing a back button and titles.
class DealsHeader extends StatelessWidget {
  /// Creates a constant [DealsHeader].
  const DealsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHeader(
      title: 'Deals',
      subtitleWidget: BlocBuilder<DealsBloc, DealsState>(
        builder: (context, state) {
          if (state is DealsLoaded) {
            final count = state.deals.length;
            final totalAmountStr = state.totalPipelineValue.toRupeeFormat();
            return Text(
              '$count active · $totalAmountStr pipeline',
              style: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            );
          }
          return const Text(
            '0 active · ₹0 pipeline',
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          );
        },
      ),
      showBackButton: true,
    );
  }
}
