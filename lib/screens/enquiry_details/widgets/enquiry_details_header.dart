import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../theme.dart';
import '../../../widgets/screen_header.dart';
import 'action_buttons.dart';
import 'edit_enquiry_button.dart';

/// Top header of the detail screen showing name, email, phone, and action buttons.
class EnquiryDetailsHeader extends StatelessWidget {
  /// Creates a constant [EnquiryDetailsHeader].
  const EnquiryDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnquiryDetailsBloc, EnquiryDetailsState>(
      buildWhen: (previous, current) {
        if (previous is EnquiryDetailsLoaded &&
            current is EnquiryDetailsLoaded) {
          return previous.lead != current.lead;
        }
        return previous.runtimeType != current.runtimeType;
      },
      builder: (context, state) {
        if (state is! EnquiryDetailsLoaded) return const SizedBox.shrink();
        final lead = state.lead;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScreenHeader(
              title: 'Enquiry Details',
              showBackButton: true,
             
              actions: EditEnquiryButton(lead: lead),
              padding: EdgeInsets.only(
                left: AppSpacing.lg,
                right: AppSpacing.lg,
                top: AppSpacing.lg,
                bottom: AppSpacing.xs,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.gapXxxl,
                  Text(
                    lead.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                      fontSize: 17.s
                    ),
                  ),
                  AppSpacing.gapXs,
                  Text(
                    lead.email ?? 'No email provided',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 12.s
                    ),
                  ),
                  AppSpacing.gapXxs,
                  Text(
                    lead.phone,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 12.s
                    ),
                  ),
                  AppSpacing.gapXl,
                  ActionButtons(lead: lead),
                  AppSpacing.gapLg,
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
