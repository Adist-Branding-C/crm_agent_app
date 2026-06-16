import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_state.dart';
import '../../../bloc/enquiry_details/enquiry_details_models.dart';
import '../../../theme.dart';
import 'note_input.dart';

/// Renders the Notes tab containing notes history and a new note input field.
class NotesTabView extends StatelessWidget {
  /// Creates a constant [NotesTabView].
  const NotesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EnquiryDetailsBloc>().state as EnquiryDetailsLoaded;
    final notes = state.notes;

    return Column(
      children: [
        const NoteInput(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${note.author}, ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                              fontSize: 13,
                            ),
                          ),
                          TextSpan(
                            text: note.content,
                            style: const TextStyle(
                              color: AppColors.textDark,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      note.time,
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
