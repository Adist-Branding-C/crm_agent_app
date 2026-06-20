import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../bloc/leads/leads_models.dart';
import 'edit_enquiry_buttons.dart';
import 'edit_enquiry_contact_fields.dart';
import 'edit_enquiry_details_fields.dart';

/// Form managing editing inputs and event dispatching.
class EditEnquiryForm extends StatefulWidget {
  final Lead lead;
  const EditEnquiryForm({super.key, required this.lead});

  @override
  State<EditEnquiryForm> createState() => _EditEnquiryFormState();
}

class _EditEnquiryFormState extends State<EditEnquiryForm> {
  late final TextEditingController _name, _phone, _email, _loc, _follow, _remarks;
  late String _src, _purp, _cat, _stat;

  @override
  void initState() {
    super.initState();
    final l = widget.lead;
    _name = TextEditingController(text: l.name);
    _phone = TextEditingController(text: l.phone);
    _email = TextEditingController(text: l.email);
    _loc = TextEditingController(text: l.location);
    _follow = TextEditingController(text: l.nextFollowUp);
    _remarks = TextEditingController(text: l.note);
    _src = l.leadSource?.label ?? LeadSource.facebook.label;
    _purp = l.source.label;
    _cat = l.category.label;
    _stat = l.status.label;
  }

  @override
  void dispose() {
    for (final c in [_name, _phone, _email, _loc, _follow, _remarks]) {
      c.dispose();
    }
    super.dispose();
  }

  void _onSave() {
    if (_name.text.trim().isEmpty || _phone.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }
    context.read<EnquiryDetailsBloc>().add(UpdateEnquiryDetails(
          name: _name.text.trim(),
          phone: _phone.text.trim(),
          email: _email.text.trim().isEmpty ? null : _email.text.trim(),
          location: _loc.text.trim(),
          source: LeadSource.values.firstWhere((e) => e.label == _src),
          purpose: LeadPurpose.values.firstWhere((e) => e.label == _purp),
          category: LeadCategory.values.firstWhere((e) => e.label == _cat),
          status: LeadStatus.values.firstWhere((e) => e.label == _stat),
          nextFollowUp: _follow.text.trim().isEmpty ? null : _follow.text.trim(),
          note: _remarks.text.trim().isEmpty ? null : _remarks.text.trim(),
        ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              EditEnquiryContactFields(
                nameController: _name, phoneController: _phone,
                emailController: _email, locationController: _loc,
              ),
              EditEnquiryDetailsFields(
                selectedSource: _src, onSourceChanged: (v) => setState(() => _src = v),
                selectedPurpose: _purp, onPurposeChanged: (v) => setState(() => _purp = v),
                selectedCategory: _cat, onCategoryChanged: (v) => setState(() => _cat = v),
                selectedStatus: _stat, onStatusChanged: (v) => setState(() => _stat = v),
                followUpController: _follow, remarksController: _remarks,
              ),
            ],
          ),
        ),
        EditEnquiryButtons(onCancel: () => Navigator.pop(context), onSave: _onSave),
      ],
    );
  }
}
