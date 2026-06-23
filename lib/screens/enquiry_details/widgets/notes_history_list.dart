import 'package:flutter/material.dart';
import '../../../bloc/enquiry_details/enquiry_details_models.dart';
import '../../../theme.dart';

/// Renders the list of notes history.
class NotesHistoryList extends StatelessWidget {
  final List<EnquiryNote> notes;

  /// Creates a constant [NotesHistoryList].
  const NotesHistoryList({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    TextSpan(
                      text: note.content,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                note.time,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
