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
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 4),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lead.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    lead.email ?? 'No email provided',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    lead.phone,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ActionButtons(lead: lead),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
