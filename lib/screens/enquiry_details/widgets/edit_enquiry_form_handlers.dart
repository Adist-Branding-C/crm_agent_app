part of 'edit_enquiry_form.dart';

extension _EditEnquiryFormHandlers on _EditEnquiryFormState {
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
}
