import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../data/repositories/leads_repository.dart';
import '../leads_enums.dart';
import '../leads_models.dart';

part 'add_lead_event.dart';
part 'add_lead_submit_event.dart';
part 'add_lead_state.dart';
part 'add_lead_state_getters.dart';
part 'add_lead_state_copy.dart';
part 'lead_name_input.dart';
part 'lead_phone_input.dart';
part 'lead_email_input.dart';

/// BLoC managing the state transitions and form validation of the Add Lead form.
class AddLeadBloc extends Bloc<AddLeadEvent, AddLeadState> {
  /// The leads repository.
  final LeadsRepository leadsRepository;

  /// Initializes the BLoC with [AddLeadState].
  AddLeadBloc({required this.leadsRepository}) : super(const AddLeadState()) {
    on<NameChanged>((ev, emit) => emit(state.copyWith(nameInput: LeadName.dirty(ev.name))));
    on<PhoneChanged>((ev, emit) => emit(state.copyWith(phoneInput: LeadPhone.dirty(ev.phone))));
    on<EmailChanged>((ev, emit) => emit(state.copyWith(emailInput: LeadEmail.dirty(ev.email))));
    on<SourceChanged>((ev, emit) => emit(state.copyWith(source: ev.source)));
    on<PurposeChanged>((ev, emit) => emit(state.copyWith(purpose: ev.purpose)));
    on<CategoryChanged>((ev, emit) => emit(state.copyWith(category: ev.category)));
    on<StatusChanged>((ev, emit) => emit(state.copyWith(status: ev.status)));
    on<LocationChanged>((ev, emit) => emit(state.copyWith(location: ev.location)));
    on<FollowUpChanged>((ev, emit) => emit(state.copyWith(nextFollowUp: () => ev.followUp)));
    on<NoteChanged>((ev, emit) => emit(state.copyWith(note: () => ev.note)));
    on<SubmitForm>(_onSubmitForm);
  }

  Future<void> _onSubmitForm(SubmitForm ev, Emitter<AddLeadState> emit) async {
    if (!state.isValid) return;
    emit(state.copyWith(isSubmitting: true, isSuccess: false, error: () => null));
    try {
      final lead = Lead(
        name: state.name.trim(), phone: state.phone.trim(), email: state.email.trim(),
        location: state.location.trim(), source: state.purpose, category: state.category,
        status: state.status, leadSource: state.source, nextFollowUp: state.nextFollowUp,
        note: state.note,
      );
      final assignedLead = await leadsRepository.addLead(lead);
      emit(state.copyWith(isSubmitting: false, isSuccess: true, lead: assignedLead));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, error: () => e.toString()));
    }
  }
}
