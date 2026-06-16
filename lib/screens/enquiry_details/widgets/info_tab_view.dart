import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_state.dart';
import '../../../theme.dart';
import 'info_item_tile.dart';
import 'status_selector.dart';

/// Renders the Info Tab containing all the descriptive fields of a lead.
class InfoTabView extends StatelessWidget {
  /// Creates a constant [InfoTabView].
  const InfoTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EnquiryDetailsBloc>().state
        as EnquiryDetailsLoaded;
    final lead = state.lead;
    const sourceFallback = 'Website';
    const followUpFallback = 'Today, 5:30 PM';
    const remarkFallback = 'Comparing with competitor. Needs pricing sheet.';

    return ListView(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 80),
      children: [
        InfoItemTile(
          label: 'Enquiry Source',
          value: lead.leadSource?.label ?? sourceFallback,
        ),
        InfoItemTile(label: 'Purpose', value: lead.source.label),
        InfoItemTile(
          label: 'Enquiry Status',
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7ED),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              lead.status.label,
              style: const TextStyle(
                color: Color(0xFFF97316),
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),
        ),
        const InfoItemTile(label: 'Agent', value: 'Arjun Nair'),
        InfoItemTile(label: 'Type', value: lead.category.label),
        InfoItemTile(label: 'Location', value: lead.location),
        InfoItemTile(
          label: 'Next Follow-up',
          value: lead.nextFollowUp ?? followUpFallback,
          valueColor: AppColors.primaryColor,
        ),
        InfoItemTile(label: 'Remarks', value: lead.note ?? remarkFallback),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () => showStatusSelector(context),
          icon: const Icon(Icons.sync, size: 18),
          label: const Text('Change Status'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
            side: const BorderSide(color: AppColors.borderLight),
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
