import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/leads/add_lead/add_lead_bloc.dart';
import '../../../bloc/leads/leads_enums.dart';
import 'add_lead_additional_fields.dart';
import 'add_lead_contact_fields.dart';
import 'add_lead_selection_fields.dart';

/// Renders all form input and selection fields for adding a lead.
class AddLeadFormFields extends StatelessWidget {
  final TextEditingController nameController, phoneController;
  final TextEditingController emailController, locationController;
  final TextEditingController followUpController, noteController;
  final LeadSource source;
  final LeadPurpose purpose;
  final LeadCategory category;
  final LeadStatus status;
  final AddLeadState state;
  final ValueChanged<LeadSource> onSourceChanged;
  final ValueChanged<LeadPurpose> onPurposeChanged;
  final ValueChanged<LeadCategory> onCategoryChanged;
  final ValueChanged<LeadStatus> onStatusChanged;

  /// Creates a constant [AddLeadFormFields].
  const AddLeadFormFields({
    super.key, required this.nameController, required this.phoneController,
    required this.emailController, required this.locationController,
    required this.followUpController, required this.noteController,
    required this.source, required this.purpose, required this.category,
    required this.status, required this.state, required this.onSourceChanged,
    required this.onPurposeChanged, required this.onCategoryChanged,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddLeadBloc>();
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          AddLeadContactFields(
            nameController: nameController, phoneController: phoneController,
            emailController: emailController, locationController: locationController,
            nameError: state.nameError, phoneError: state.phoneError, emailError: state.emailError,
            onNameChanged: (v) => bloc.add(NameChanged(v)),
            onPhoneChanged: (v) => bloc.add(PhoneChanged(v)),
            onEmailChanged: (v) => bloc.add(EmailChanged(v)),
          ),
          const SizedBox(height: 16),
          AddLeadSelectionFields(
            source: source, onSourceChanged: onSourceChanged,
            purpose: purpose, onPurposeChanged: onPurposeChanged,
            category: category, onCategoryChanged: onCategoryChanged,
            status: status, onStatusChanged: onStatusChanged,
          ),
          const SizedBox(height: 16),
          AddLeadAdditionalFields(
            followUpController: followUpController, noteController: noteController,
          ),
        ],
      ),
    );
  }
}
