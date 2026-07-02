import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../bloc/leads/leads_enums.dart';

void saveEnquiry({
  required BuildContext context,
  required String name,
  required String phone,
  required String email,
  required String location,
  required String sourceLabel,
  required String purposeLabel,
  required String categoryLabel,
  required String statusLabel,
  required String followUp,
  required String note,
}) {
  if (name.isEmpty || phone.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please fill all required fields')),
    );
    return;
  }
  context.read<EnquiryDetailsBloc>().add(
    UpdateEnquiryDetails(
      name: name,
      phone: phone,
      email: email.isEmpty ? null : email,
      location: location,
      source: LeadSource.values.firstWhere((e) => e.label == sourceLabel),
      purpose: LeadPurpose.values.firstWhere((e) => e.label == purposeLabel),
      category: LeadCategory.values.firstWhere((e) => e.label == categoryLabel),
      status: LeadStatus.values.firstWhere((e) => e.label == statusLabel),
      nextFollowUp: followUp.isEmpty ? null : followUp,
      note: note.isEmpty ? null : note,
    ),
  );
  context.pop();
}
