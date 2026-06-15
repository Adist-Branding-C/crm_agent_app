import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/leads/add_lead/add_lead_bloc.dart';
import '../../../widgets/custom_button.dart';
import 'add_lead_additional_fields.dart';
import 'add_lead_contact_fields.dart';
import 'add_lead_selection_fields.dart';

/// Form widget managing text inputs and selections for adding a lead.
class AddLeadForm extends StatefulWidget {
  /// Creates a constant [AddLeadForm].
  const AddLeadForm({super.key});
  @override
  State<AddLeadForm> createState() => _AddLeadFormState();
}

class _AddLeadFormState extends State<AddLeadForm> {
  final _name = TextEditingController(), _phone = TextEditingController();
  final _email = TextEditingController(), _loc = TextEditingController();
  final _follow = TextEditingController(), _note = TextEditingController();
  String _src = 'Facebook', _purp = 'Enquiry', _cat = 'Warm', _status = 'New';

  @override
  void dispose() {
    for (final c in [_name, _phone, _email, _loc, _follow, _note]) {
      c.dispose();
    }
    super.dispose();
  }

  void _onState(BuildContext context, AddLeadState state) {
    if (state.isSuccess && state.lead != null) {
      Navigator.pop(context, state.lead);
    }
    if (state.error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.error!)));
    }
  }

  void _onSubmit() {
    context.read<AddLeadBloc>().add(
      SubmitForm(
        name: _name.text,
        phone: _phone.text,
        email: _email.text,
        location: _loc.text.isEmpty ? 'Kochi' : _loc.text,
        source: _src,
        purpose: _purp,
        category: _cat,
        status: _status,
        nextFollowUp: _follow.text.isEmpty ? null : _follow.text,
        note: _note.text.isEmpty ? null : _note.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddLeadBloc, AddLeadState>(
      listener: _onState,
      builder: (context, state) => Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  AddLeadContactFields(
                    nameController: _name,
                    phoneController: _phone,
                    emailController: _email,
                    locationController: _loc,
                    nameError: state.nameError,
                    phoneError: state.phoneError,
                    emailError: state.emailError,
                    onNameChanged: (v) =>
                        context.read<AddLeadBloc>().add(NameChanged(v)),
                    onPhoneChanged: (v) =>
                        context.read<AddLeadBloc>().add(PhoneChanged(v)),
                    onEmailChanged: (v) =>
                        context.read<AddLeadBloc>().add(EmailChanged(v)),
                  ),
                  const SizedBox(height: 16),
                  AddLeadSelectionFields(
                    source: _src,
                    onSourceChanged: (v) => setState(() => _src = v),
                    purpose: _purp,
                    onPurposeChanged: (v) => setState(() => _purp = v),
                    category: _cat,
                    onCategoryChanged: (v) => setState(() => _cat = v),
                    status: _status,
                    onStatusChanged: (v) => setState(() => _status = v),
                  ),
                  const SizedBox(height: 16),
                  AddLeadAdditionalFields(
                    followUpController: _follow,
                    noteController: _note,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: CustomButton(
              text: 'Save Lead',
              isLoading: state.isSubmitting,
              onPressed: state.isValid ? _onSubmit : null,
            ),
          ),
        ],
      ),
    );
  }
}
