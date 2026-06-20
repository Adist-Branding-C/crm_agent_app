import 'package:flutter_bloc/flutter_bloc.dart';
import '../enquiry_details_bloc.dart';
import '../enquiry_details_models.dart';

extension NoteHandler on EnquiryDetailsBloc {
  Future<void> onAddNote(AddEnquiryNote ev, Emitter<EnquiryDetailsState> emit) async {
    final s = state;
    if (s is! EnquiryDetailsLoaded) return;
    final newNote = EnquiryNote(
      id: DateTime.now().toString(), author: '@You',
      content: ev.content, time: 'Just now',
    );
    final newAct = EnquiryActivity(
      id: DateTime.now().toString(),
      title: '@You added a note on ${s.lead.name}',
      time: 'Just now', type: EnquiryActivityType.note,
    );
    activityRepository.addActivityForLead(s.lead.id, newAct);
    emit(s.copyWith(
      notes: [newNote, ...s.notes],
      activities: [newAct, ...s.activities],
    ));
  }
}
