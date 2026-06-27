import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../router/app_routes.dart';
import '../../../theme.dart';

/// Small chip-like button to open the Edit Enquiry screen.
class EditEnquiryButton extends StatelessWidget {
  /// The lead to edit.
  final Lead lead;

  /// Creates a constant [EditEnquiryButton].
  const EditEnquiryButton({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        AppRoutes.editEnquiry,
        pathParameters: {'id': lead.id},
        extra: context.read<EnquiryDetailsBloc>(),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs2,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColorLight,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
             Icon(
              Icons.edit_outlined,
              size: 13.s,
              color: AppColors.primaryColor,
            ),
            AppSpacing.gapWXs,
            Text(
              'Edit',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 12.s
              ),
            ),
          ],
        ),
      ),
    );
  }
}
