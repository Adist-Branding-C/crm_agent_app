import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../widgets/responsive_width_container.dart';
import 'edit_enquiry_buttons.dart';
import 'edit_enquiry_form_fields_container.dart';
import 'edit_enquiry_save_helper.dart';

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

  void _onSave() {
    saveEnquiry(
      context: context, name: _name.text.trim(), phone: _phone.text.trim(),
      email: _email.text.trim(), location: _loc.text.trim(), sourceLabel: _src,
      purposeLabel: _purp, categoryLabel: _cat, statusLabel: _stat,
      followUp: _follow.text.trim(), note: _remarks.text.trim(),
    );
  }

  @override
  void dispose() {
    for (final c in [_name, _phone, _email, _loc, _follow, _remarks]) c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidthContainer(
      maxWidth: 540.w,
      child: Column(
        children: [
          Expanded(
            child: EditEnquiryFormFieldsContainer(
              name: _name, phone: _phone, email: _email, location: _loc,
              src: _src, onSrcChanged: (v) => setState(() => _src = v),
              purp: _purp, onPurpChanged: (v) => setState(() => _purp = v),
              cat: _cat, onCatChanged: (v) => setState(() => _cat = v),
              stat: _stat, onStatChanged: (v) => setState(() => _stat = v),
              follow: _follow, remarks: _remarks,
            ),
          ),
          EditEnquiryButtons(onCancel: () => context.pop(), onSave: _onSave),
        ],
      ),
    );
  }
}
