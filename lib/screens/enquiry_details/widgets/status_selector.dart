import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../bloc/leads/leads_enums.dart';

/// Shows a bottom sheet to select a new lead status.
void showStatusSelector(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (c) => SafeArea(
      child: ListView(
        shrinkWrap: true,
        children: LeadStatus.values
            .map(
              (s) => ListTile(
                title: Text(s.label),
                onTap: () {
                  context.read<EnquiryDetailsBloc>().add(
                    ChangeEnquiryStatus(s),
                  );
                  c.pop();
                },
              ),
            )
            .toList(),
      ),
    ),
  );
}
