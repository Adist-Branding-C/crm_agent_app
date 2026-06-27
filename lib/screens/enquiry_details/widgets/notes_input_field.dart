import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/enquiry_details/enquiry_details_bloc.dart';
import '../../../theme.dart';

/// A widget that provides an input field and submit button for adding notes.
class NotesInputField extends StatefulWidget {
  /// Creates a constant [NotesInputField].
  const NotesInputField({super.key});

  @override
  State<NotesInputField> createState() => _NotesInputFieldState();
}

class _NotesInputFieldState extends State<NotesInputField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      margin: EdgeInsets.symmetric(vertical: AppSpacing.lg),
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hint: Text(
                  'Add your notes here...',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 14.s),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 10.h,
                ),
              ),
            ),
          ),
          AppSpacing.gapWSm,
          IconButton(
            onPressed: _submitNote,
            icon: Icon(Icons.send, color: Colors.white, size: 18.s),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: EdgeInsets.all(AppSpacing.xxs),
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
