import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/deals/deals_bloc.dart';
import '../../../../utils/currency_formatter.dart';
import '../../../../widgets/screen_header.dart';

/// Header widget for the Deals screen showing a back button and titles.
class DealsHeader extends StatelessWidget {
  /// Creates a constant [DealsHeader].
  const DealsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.select((DealsBloc b) {
      final s = b.state;
      return s is DealsLoaded ? s.deals.length : 0;
    });

    final pipeline = context.select((DealsBloc b) {
      final s = b.state;
      return s is DealsLoaded ? s.totalPipelineValue.toRupeeFormat() : '₹0';
    });

    return ScreenHeader(
      title: 'Deals',
      subtitle: '$count active · $pipeline pipeline',
      showBackButton: true,
    );
  }
}
