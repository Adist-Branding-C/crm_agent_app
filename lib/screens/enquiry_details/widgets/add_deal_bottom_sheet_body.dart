import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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

  Future<void> _submit() async {
    if (!_controller.isValid) return;
    final deal = Deal(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _controller.nameController.text.trim(),
      clientName: widget.lead.name,
      amount: double.parse(_controller.amountController.text.trim()),
      stage: _controller.selectedStage,
      closeDate: AddDealDatePickerHelper.formatCloseDate(
        _controller.expectedClose!,
      ),
    );
    _controller.setLoading(true);
    _controller.setError(null);
    context.read<DealsBloc>().add(AddDeal(deal));
    try {
      final result = await context
          .read<DealsBloc>()
          .stream
          .firstWhere((s) => s is DealAdded && s.deal.id == deal.id)
          .timeout(const Duration(seconds: 15));
      if (!mounted) return;
      final added = result as DealAdded;
      if (added.error != null) {
        _controller.setError(added.error);
        _controller.setLoading(false);
      } else {
        context.pop(true);
      }
    } catch (_) {
      if (!mounted) return;
      _controller.setError('Unable to add deal. Please try again.');
      _controller.setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) => AddDealBottomSheetContent(
        lead: widget.lead,
        controller: _controller,
        onSubmit: _submit,
      ),
    );
  }
}
