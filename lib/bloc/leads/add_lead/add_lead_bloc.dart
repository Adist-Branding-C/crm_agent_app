import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/leads_repository.dart';
import '../leads_models.dart';
import 'add_lead_event.dart';
import 'add_lead_state.dart';
import 'add_lead_state_extensions.dart';
import 'lead_name_input.dart';
import 'lead_phone_input.dart';
import 'lead_email_input.dart';

export 'add_lead_event.dart';
export 'add_lead_form_inputs.dart';
export 'add_lead_state.dart';
export 'add_lead_state_extensions.dart';
export 'add_lead_submission_status.dart';
export 'lead_name_input.dart';
export 'lead_phone_input.dart';
export 'lead_email_input.dart';

/// BLoC managing the state transitions and form validation of the Add Lead form.
class AddLeadBloc extends Bloc<AddLeadEvent, AddLeadState> {
  final LeadsRepository leadsRepository;

  AddLeadBloc({required this.leadsRepository}) : super(const AddLeadState()) {
    on<NameChanged>(
      (ev, emit) => emit(state.copyWith(nameInput: LeadName.dirty(ev.name))),
    );
    on<PhoneChanged>(
      (ev, emit) => emit(state.copyWith(phoneInput: LeadPhone.dirty(ev.phone))),
    );
    on<EmailChanged>(
      (ev, emit) => emit(state.copyWith(emailInput: LeadEmail.dirty(ev.email))),
    );
    on<SourceChanged>((ev, emit) => emit(state.copyWith(source: ev.source)));
    on<PurposeChanged>((ev, emit) => emit(state.copyWith(purpose: ev.purpose)));
    on<CategoryChanged>(
      (ev, emit) => emit(state.copyWith(category: ev.category)),
    );
    on<StatusChanged>((ev, emit) => emit(state.copyWith(status: ev.status)));
    on<LocationChanged>(
      (ev, emit) => emit(state.copyWith(location: ev.location)),
    );
    on<FollowUpChanged>(
      (ev, emit) => emit(state.copyWith(nextFollowUp: () => ev.followUp)),
    );
    on<NoteChanged>((ev, emit) => emit(state.copyWith(note: () => ev.note)));
    on<SubmitForm>(_onSubmitForm);
  }

  Future<void> _onSubmitForm(SubmitForm ev, Emitter<AddLeadState> emit) async {
    if (!state.isValid) return;
    emit(
      state.copyWith(isSubmitting: true, isSuccess: false, error: () => null),
    );
    try {
      final f = state.formInputs;
      final lead = Lead(
        name: f.nameInput.value.trim(),
        phone: f.phoneInput.value.trim(),
        email: f.emailInput.value.trim(),
        location: f.location.trim(),
        source: f.purpose,
        category: f.category,
        status: f.status,
        leadSource: f.source,
        nextFollowUp: f.nextFollowUp,
        note: f.note,
      );
      final assignedLead = await leadsRepository.addLead(lead);
      emit(
        state.copyWith(
          isSubmitting: false,
          isSuccess: true,
          lead: assignedLead,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, error: () => e.toString()));
    }
  }
}
