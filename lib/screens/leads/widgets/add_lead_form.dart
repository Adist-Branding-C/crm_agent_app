import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/leads/add_lead/add_lead_bloc.dart';
import '../../../widgets/custom_button.dart';
import '../../../theme.dart';
import 'add_lead_form_fields.dart';

/// Form widget managing text inputs and selections for adding a lead.
class AddLeadForm extends StatefulWidget {
  const AddLeadForm({super.key});
  @override
  State<AddLeadForm> createState() => _AddLeadFormState();
}

class _AddLeadFormState extends State<AddLeadForm> {
  late final AddLeadBloc _bloc;
  final _name = TextEditingController(), _phone = TextEditingController();
  final _email = TextEditingController(), _loc = TextEditingController();
  final _follow = TextEditingController(), _note = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AddLeadBloc>();
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
              onSourceChanged: (v) => _bloc.add(SourceChanged(v)),
              onPurposeChanged: (v) => _bloc.add(PurposeChanged(v)),
              onCategoryChanged: (v) => _bloc.add(CategoryChanged(v)),
              onStatusChanged: (v) => _bloc.add(StatusChanged(v)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSpacing.xxl),
            child: CustomButton(
              text: 'Save Lead',
              isLoading: state.isSubmitting,
              onPressed: state.isValid ? () => _bloc.add(const SubmitForm()) : null,
            ),
          ),
        ],
      ),
    );
  }
}
