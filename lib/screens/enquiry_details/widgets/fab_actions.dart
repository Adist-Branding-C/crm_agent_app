import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../router/app_routes.dart';
import '../../../theme.dart';
import 'add_deal_bottom_sheet.dart';
import 'fab_menu_action.dart';

class FabActions {
  FabActions._();

  static List<FabMenuAction> build(BuildContext context, VoidCallback onTapItem) => [
    _addDealAction(context, onTapItem),
    _addTaskAction(context, onTapItem),
    _addCallLogAction(context, onTapItem),
    _deleteAction(context, onTapItem),
  ];

  static FabMenuAction _addDealAction(BuildContext context, VoidCallback onTapItem) =>
    FabMenuAction(
      label: 'Add Deal', icon: Icons.business_center, color: AppColors.accent,
      onTap: () async {
        onTapItem();
        final state = context.read<EnquiryDetailsBloc>().state;
        if (state is EnquiryDetailsLoaded) {
          final router = GoRouter.of(context);
          final added = await AddDealBottomSheet.show(context, state.lead);
          if (added == true && context.mounted) {
            router.pushNamed(AppRoutes.deals);
          }
        }
      },
    );

  static FabMenuAction _addTaskAction(BuildContext context, VoidCallback onTapItem) =>
    FabMenuAction(
      label: 'Add Task', icon: Icons.calendar_month, color: AppColors.warning,
      onTap: () {
        onTapItem();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Add Task clicked')),
        );
      },
    );

  static FabMenuAction _addCallLogAction(BuildContext context, VoidCallback onTapItem) =>
    FabMenuAction(
      label: 'Add Call Log', icon: Icons.phone_callback, color: AppColors.success,
      onTap: () {
        onTapItem();
        final s = context.read<EnquiryDetailsBloc>().state;
        if (s is EnquiryDetailsLoaded) context.pushNamed(AppRoutes.callLog, extra: s.lead);
      },
    );

  static FabMenuAction _deleteAction(BuildContext context, VoidCallback onTapItem) =>
    FabMenuAction(
      label: 'Delete', icon: Icons.delete, color: AppColors.errorColor,
      onTap: () {
        onTapItem();
        context.read<EnquiryDetailsBloc>().add(const DeleteEnquiry());
      },
    );
}
