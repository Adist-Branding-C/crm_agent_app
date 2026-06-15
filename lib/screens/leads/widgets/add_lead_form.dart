import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/leads/add_lead/add_lead_bloc.dart';
import '../../../widgets/custom_button.dart';
import 'add_lead_form_fields.dart';

/// Form widget managing text inputs and selections for adding a lead.
class AddLeadForm extends StatefulWidget {
  const AddLeadForm({super.key});
  @override
  State<AddLeadForm> createState() => _AddLeadFormState();
}

class _AddLeadFormState extends State<AddLeadForm> {
  final _name = TextEditingController(), _phone = TextEditingController();
  final _email = TextEditingController(), _loc = TextEditingController();
  final _follow = TextEditingController(), _note = TextEditingController();

  @override
  void dispose() {
    for (final c in [_name, _phone, _email, _loc, _follow, _note]) {
      c.dispose();
    }
    super.dispose();
  }

  void _onState(BuildContext context, AddLeadState state) {
    if (state.isSuccess) context.pop(true);
    if (state.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error!)));
    }
  }

  void _onSubmit() {
    final s = context.read<AddLeadBloc>().state;
    context.read<AddLeadBloc>().add(SubmitForm(
      name: _name.text, phone: _phone.text, email: _email.text,
      location: _loc.text.isEmpty ? 'Kochi' : _loc.text,
      source: s.source, purpose: s.purpose, category: s.category, status: s.status,
      nextFollowUp: _follow.text.isEmpty ? null : _follow.text,
      note: _note.text.isEmpty ? null : _note.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddLeadBloc>();
    return BlocConsumer<AddLeadBloc, AddLeadState>(
      listener: _onState,
      builder: (context, state) => Column(
        children: [
          Expanded(
            child: AddLeadFormFields(
              nameController: _name, phoneController: _phone,
              emailController: _email, locationController: _loc,
              followUpController: _follow, noteController: _note,
              source: state.source, purpose: state.purpose,
              category: state.category, status: state.status, state: state,
              onSourceChanged: (v) => bloc.add(SourceChanged(v)),
              onPurposeChanged: (v) => bloc.add(PurposeChanged(v)),
              onCategoryChanged: (v) => bloc.add(CategoryChanged(v)),
              onStatusChanged: (v) => bloc.add(StatusChanged(v)),
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
