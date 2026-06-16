import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_event.dart';
import '../../../bloc/enquiry_details/enquiry_details_state.dart';
import '../../../router/app_routes.dart';
import '../../../theme.dart';
import 'fab_menu_item.dart';

/// The expanded sub-menu options for the [FabMenu].
class FabExpandedMenu extends StatelessWidget {
  /// Callback to close the menu on item tap.
  final VoidCallback onTapItem;

  /// Creates a [FabExpandedMenu].
  const FabExpandedMenu({super.key, required this.onTapItem});

  void _showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        FabMenuItem(
          text: 'Add Deal',
          icon: Icons.business_center,
          color: AppColors.accent,
          onTap: () {
            onTapItem();
            _showSnackBar(context, 'Add Deal clicked');
          },
        ),
        const SizedBox(height: 12),
        FabMenuItem(
          text: 'Add Task',
          icon: Icons.calendar_month,
          color: AppColors.warning,
          onTap: () {
            onTapItem();
            _showSnackBar(context, 'Add Task clicked');
          },
        ),
        const SizedBox(height: 12),
        FabMenuItem(
          text: 'Add Call Log',
          icon: Icons.phone_callback,
          color: AppColors.success,
          onTap: () {
            onTapItem();
            final state = context.read<EnquiryDetailsBloc>().state;
            if (state is EnquiryDetailsLoaded) {
              context.pushNamed(
                AppRoutes.callLog,
                queryParameters: {'enquiryId': state.enquiry.id},
              );
            }
          },
        ),
        const SizedBox(height: 12),
        FabMenuItem(
          text: 'Delete',
          icon: Icons.delete,
          color: AppColors.errorColor,
          onTap: () {
            onTapItem();
            context.read<EnquiryDetailsBloc>().add(const DeleteEnquiry());
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
