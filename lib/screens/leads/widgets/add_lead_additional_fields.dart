import 'package:flutter/material.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/custom_card.dart';
import '../../../theme.dart';

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
    return CustomCard(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          CustomTextField(
            label: 'Next Follow-up',
            hintText: 'e.g. Tomorrow, 11:00 AM',
            controller: followUpController,
          ),
          AppSpacing.gapLg,
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
