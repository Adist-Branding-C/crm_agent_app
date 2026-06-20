import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../router/app_routes.dart';
import '../../../theme.dart';
import 'add_deal_bottom_sheet.dart';
import 'fab_menu_action.dart';
import 'fab_menu_item.dart';

/// The expanded sub-menu options for the [FabMenu].
class FabExpandedMenu extends StatelessWidget {
  final VoidCallback onTapItem;

  const FabExpandedMenu({super.key, required this.onTapItem});

  List<FabMenuAction> _buildActions(BuildContext context) {
    return [
      FabMenuAction(
        label: 'Add Deal',
        icon: Icons.business_center,
        color: AppColors.accent,
        onTap: () async {
          onTapItem();
          final state = context.read<EnquiryDetailsBloc>().state;
          if (state is EnquiryDetailsLoaded) {
            final router = GoRouter.of(context);
            final added = await AddDealBottomSheet.show(context, state.lead);
            if (added == true) {
              router.pushNamed(AppRoutes.deals);
            }
          }
        },
      ),
      FabMenuAction(label: 'Add Task', icon: Icons.calendar_month, color: AppColors.warning, onTap: () { onTapItem(); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Add Task clicked'))); }),
      FabMenuAction(label: 'Add Call Log', icon: Icons.phone_callback, color: AppColors.success, onTap: () { onTapItem(); final s = context.read<EnquiryDetailsBloc>().state; if (s is EnquiryDetailsLoaded) context.pushNamed(AppRoutes.callLog, extra: s.lead); }),
      FabMenuAction(label: 'Delete', icon: Icons.delete, color: AppColors.errorColor, onTap: () { onTapItem(); context.read<EnquiryDetailsBloc>().add(const DeleteEnquiry()); }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final actions = _buildActions(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final action in actions) ...[
          FabMenuItem(text: action.label, icon: action.icon, color: action.color, onTap: action.onTap),
          const SizedBox(height: 12),
        ],
        const SizedBox(height: 16),
      ],
    );
  }
}
