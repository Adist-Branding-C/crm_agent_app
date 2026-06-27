import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/deals/deals_bloc.dart';
import '../../../bloc/deals/deals_models.dart';
import '../../../bloc/leads/leads_models.dart';
import 'add_deal_bottom_sheet_content.dart';
import 'add_deal_controller.dart';
import 'add_deal_date_picker_helper.dart';

class AddDealBottomSheetBody extends StatefulWidget {
  final Lead lead;
  const AddDealBottomSheetBody({super.key, required this.lead});

  @override
  State<AddDealBottomSheetBody> createState() => _AddDealBottomSheetBodyState();
}

class _AddDealBottomSheetBodyState extends State<AddDealBottomSheetBody> {
  late final AddDealController _controller;
  String? _submittedDealId;

  @override
  void initState() {
    super.initState();
    _controller = AddDealController(lead: widget.lead);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_controller.isValid) return;
    final dealId = DateTime.now().millisecondsSinceEpoch.toString();
    _submittedDealId = dealId;
    final deal = Deal(
      id: dealId,
      title: _controller.nameController.text.trim(),
      clientName: widget.lead.name,
      amount: double.parse(_controller.amountController.text.trim()),
      stage: _controller.selectedStage,
      closeDate: AddDealDatePickerHelper.formatCloseDate(_controller.expectedClose!),
    );
    _controller.setLoading(true);
    _controller.setError(null);
    context.read<DealsBloc>().add(AddDeal(deal));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DealsBloc, DealsState>(
      listenWhen: (prev, curr) =>
          curr is DealAdded && curr.deal.id == _submittedDealId,
      listener: (context, state) {
        if (state is DealAdded) {
          _controller.setLoading(false);
          if (state.error != null) {
            _controller.setError(state.error);
          } else {
            Navigator.of(context).pop(true);
          }
        }
      },
      child: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) => AddDealBottomSheetContent(
          lead: widget.lead,
          controller: _controller,
          onSubmit: _submit,
        ),
      ),
    );
  }
}
