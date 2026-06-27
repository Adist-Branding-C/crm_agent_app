import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';

class NoteBlock extends StatelessWidget {
  final String? approvedBy;
  final String? note;

  const NoteBlock({super.key, this.approvedBy, this.note});

  @override
  Widget build(BuildContext context) {
    final isApproved = approvedBy != null;
    final text = approvedBy ?? note!;
    final icon = isApproved
        ? Icons.check_circle_outline
        : Icons.error_outline_rounded;
    final color = isApproved ? AppColors.success : AppColors.warningText;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 10.s,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
