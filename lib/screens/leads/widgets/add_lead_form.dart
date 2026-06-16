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
  void initState() {
    super.initState();
    final bloc = context.read<AddLeadBloc>();
    _name.addListener(() => bloc.add(NameChanged(_name.text)));
    _phone.addListener(() => bloc.add(PhoneChanged(_phone.text)));
    _email.addListener(() => bloc.add(EmailChanged(_email.text)));
    _loc.addListener(() => bloc.add(LocationChanged(_loc.text)));
    _follow.addListener(() => bloc.add(FollowUpChanged(_follow.text)));
    _note.addListener(() => bloc.add(NoteChanged(_note.text)));
  }

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

  @override
  Widget build(BuildContext context) {
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
              onSourceChanged: (v) => context.read<AddLeadBloc>().add(SourceChanged(v)),
              onPurposeChanged: (v) => context.read<AddLeadBloc>().add(PurposeChanged(v)),
              onCategoryChanged: (v) => context.read<AddLeadBloc>().add(CategoryChanged(v)),
              onStatusChanged: (v) => context.read<AddLeadBloc>().add(StatusChanged(v)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: CustomButton(
              text: 'Save Lead',
              isLoading: state.isSubmitting,
              onPressed: state.isValid
                  ? () => context.read<AddLeadBloc>().add(const SubmitForm())
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
