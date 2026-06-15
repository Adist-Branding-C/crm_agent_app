import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_event.dart';
import '../../../bloc/enquiry_details/enquiry_details_models.dart';
import '../../../theme.dart';

/// Renders the Notes tab containing notes history and a new note input field.
class NotesTabView extends StatefulWidget {
  /// The list of notes to show.
  final List<EnquiryNote> notes;

  /// Creates a constant [NotesTabView].
  const NotesTabView({super.key, required this.notes});

  @override
  State<NotesTabView> createState() => _NotesTabViewState();
}

class _NotesTabViewState extends State<NotesTabView> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Add your notes here...',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  final text = _controller.text.trim();
                  if (text.isNotEmpty) {
                    context.read<EnquiryDetailsBloc>().add(AddEnquiryNote(text));
                    _controller.clear();
                  }
                },
                icon: const Icon(Icons.send, color: Colors.white),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.all(12),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: widget.notes.length,
            itemBuilder: (context, index) {
              final note = widget.notes[index];
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
                            style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textDark, fontSize: 13),
                          ),
                          TextSpan(
                            text: note.content,
                            style: const TextStyle(color: AppColors.textDark, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(note.time, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
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
