import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_event.dart';
import '../../../theme.dart';

/// A widget that provides an input field and submit button for adding notes.
class NoteInput extends StatefulWidget {
  /// Creates a constant [NoteInput].
  const NoteInput({super.key});

  @override
  State<NoteInput> createState() => _NoteInputState();
}

class _NoteInputState extends State<NoteInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Add your notes here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: _submitNote,
            icon: const Icon(Icons.send, color: Colors.white),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: const EdgeInsets.all(12),
            ),
          ),
        ],
      ),
    );
  }

  void _submitNote() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      context.read<EnquiryDetailsBloc>().add(AddEnquiryNote(text));
      _controller.clear();
    }
  }
}
