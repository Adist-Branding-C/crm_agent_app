import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/deals/deals_bloc.dart';
import '../../../bloc/leads/leads_models.dart';
import 'add_deal_bottom_sheet_body.dart';

class AddDealBottomSheet extends StatelessWidget {
  final Lead lead;
  const AddDealBottomSheet({super.key, required this.lead});

  static Future<bool?> show(BuildContext context, Lead lead) {
    final dealsBloc = context.read<DealsBloc>();
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => BlocProvider.value(
        value: dealsBloc,
        child: AddDealBottomSheet(lead: lead),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AddDealBottomSheetBody(lead: lead);
  }
}
