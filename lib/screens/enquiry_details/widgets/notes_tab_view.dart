import 'package:flutter/material.dart';
import '../../../bloc/enquiry_details/enquiry_details_models.dart';
import 'notes_input_field.dart';
import 'notes_history_list.dart';

/// Renders the Notes tab containing notes history and a new note input field.
class NotesTabView extends StatelessWidget {
  final List<EnquiryNote> notes;
  const NotesTabView({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NotesInputField(),
        Expanded(child: NotesHistoryList(notes: notes)),
      ],
    );
  }
}
