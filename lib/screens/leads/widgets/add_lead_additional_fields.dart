import 'package:flutter/material.dart';
import '../../../widgets/custom_text_field.dart';

/// Additional information input fields section.
class AddLeadAdditionalFields extends StatelessWidget {
  /// Controller for next follow up field.
  final TextEditingController followUpController;

  /// Controller for note field.
  final TextEditingController noteController;

  /// Creates a constant [AddLeadAdditionalFields].
  const AddLeadAdditionalFields({
    super.key,
    required this.followUpController,
    required this.noteController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CustomTextField(
            label: 'Next Follow-up',
            hintText: 'e.g. Tomorrow, 11:00 AM',
            controller: followUpController,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Note',
            hintText: 'Anything important about this lead...',
            controller: noteController,
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
