import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../theme.dart';
import '../../../widgets/screen_header.dart';
import 'action_buttons.dart';

/// Top header of the detail screen showing name, email, phone, and action buttons.
class EnquiryDetailsHeader extends StatelessWidget {
  /// The lead data.
  final Lead lead;

  /// Creates a constant [EnquiryDetailsHeader].
  const EnquiryDetailsHeader({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ScreenHeader(
          title: 'Enquiry Details',
          showBackButton: true,
          padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 4),
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
  }
}
