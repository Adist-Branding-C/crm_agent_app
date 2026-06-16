import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_state.dart';
import 'notes_input_field.dart';
import 'notes_history_list.dart';

/// Renders the Notes tab containing notes history and a new note input field.
class NotesTabView extends StatelessWidget {
  /// Creates a constant [NotesTabView].
  const NotesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EnquiryDetailsBloc>().state as EnquiryDetailsLoaded;
    return Column(
      children: [
        const NotesInputField(),
        Expanded(
          child: NotesHistoryList(notes: state.notes),
        ),
      ],
    );
  }
}
