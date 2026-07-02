import 'package:flutter/material.dart';
import 'edit_enquiry_contact_fields.dart';
import 'edit_enquiry_details_fields.dart';

class EditEnquiryFormFieldsContainer extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController location;
  final String src;
  final ValueChanged<String> onSrcChanged;
  final String purp;
  final ValueChanged<String> onPurpChanged;
  final String cat;
  final ValueChanged<String> onCatChanged;
  final String stat;
  final ValueChanged<String> onStatChanged;
  final TextEditingController follow;
  final TextEditingController remarks;

  const EditEnquiryFormFieldsContainer({
    super.key,
    required this.name,
    required this.phone,
    required this.email,
    required this.location,
    required this.src,
    required this.onSrcChanged,
    required this.purp,
    required this.onPurpChanged,
    required this.cat,
    required this.onCatChanged,
    required this.stat,
    required this.onStatChanged,
    required this.follow,
    required this.remarks,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        EditEnquiryContactFields(
          nameController: name,
          phoneController: phone,
          emailController: email,
          locationController: location,
        ),
        EditEnquiryDetailsFields(
          selectedSource: src,
          onSourceChanged: onSrcChanged,
          selectedPurpose: purp,
          onPurposeChanged: onPurpChanged,
          selectedCategory: cat,
          onCategoryChanged: onCatChanged,
          selectedStatus: stat,
          onStatusChanged: onStatChanged,
          followUpController: follow,
          remarksController: remarks,
        ),
      ],
    );
  }
}
