import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import 'deal_list_card.dart';

/// Renders the Deals list view scrollable vertically.
class DealsListView extends StatelessWidget {
  final List<Deal> deals;

  /// Creates a constant [DealsListView].
  const DealsListView({super.key, required this.deals});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: deals.length,
        itemBuilder: (context, index) {
          return DealListCard(deal: deals[index]);
        },
      ),
    );
  }
}
