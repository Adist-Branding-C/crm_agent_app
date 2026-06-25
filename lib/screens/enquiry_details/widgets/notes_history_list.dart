import 'package:flutter/material.dart';
import '../../../bloc/enquiry_details/enquiry_details_models.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';

/// Renders the list of notes history.
class NotesHistoryList extends StatelessWidget {
  final List<EnquiryNote> notes;

  /// Creates a constant [NotesHistoryList].
  const NotesHistoryList({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return Center(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.slate100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.description_outlined,
                  size: 40,
                  color: AppColors.slate400,
                ),
              ),
              AppSpacing.gapLg,
              Text(
                'No notes yet',
                style: TextStyle(
                  fontSize: context.scaleFont(16),
                  color: AppColors.textDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpacing.gapSm,
              Text(
                'Log your first note for this enquiry.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: context.scaleFont(14),
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.xl),
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
              AppSpacing.gapXs,
              Text(
                note.time,
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: AppColors.textMuted),
              ),
            ],
          ),
        );
      },
    );
  }
}

