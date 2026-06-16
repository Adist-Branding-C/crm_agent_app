import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../data/constants.dart';
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
    on<NameChanged>(_onNameChanged);
    on<PhoneChanged>(_onPhoneChanged);
    on<EmailChanged>(_onEmailChanged);
    on<SourceChanged>(_onSourceChanged);
    on<PurposeChanged>(_onPurposeChanged);
    on<CategoryChanged>(_onCategoryChanged);
    on<StatusChanged>(_onStatusChanged);
    on<SubmitForm>(_onSubmitForm);
  }

  void _onNameChanged(NameChanged ev, Emitter<AddLeadState> emit) =>
      emit(state.copyWith(nameInput: LeadName.dirty(ev.name)));

  void _onPhoneChanged(PhoneChanged ev, Emitter<AddLeadState> emit) =>
      emit(state.copyWith(phoneInput: LeadPhone.dirty(ev.phone)));

  void _onEmailChanged(EmailChanged ev, Emitter<AddLeadState> emit) =>
      emit(state.copyWith(emailInput: LeadEmail.dirty(ev.email)));

  void _onSourceChanged(SourceChanged ev, Emitter<AddLeadState> emit) =>
      emit(state.copyWith(source: ev.source));

  void _onPurposeChanged(PurposeChanged ev, Emitter<AddLeadState> emit) =>
      emit(state.copyWith(purpose: ev.purpose));

  void _onCategoryChanged(CategoryChanged ev, Emitter<AddLeadState> emit) =>
      emit(state.copyWith(category: ev.category));

  void _onStatusChanged(StatusChanged ev, Emitter<AddLeadState> emit) =>
      emit(state.copyWith(status: ev.status));

  Future<void> _onSubmitForm(SubmitForm ev, Emitter<AddLeadState> emit) async {
    if (!state.isValid) return;
    emit(state.copyWith(isSubmitting: true, isSuccess: false, error: () => null));
    try {
      final lead = Lead(
        name: ev.name.trim(), phone: ev.phone.trim(), email: ev.email.trim(),
        location: ev.location.trim(), source: ev.purpose, category: ev.category,
        status: ev.status, leadSource: ev.source, nextFollowUp: ev.nextFollowUp,
        note: ev.note,
      );
      final assignedLead = await leadsRepository.addLead(lead);
      emit(state.copyWith(isSubmitting: false, isSuccess: true, lead: assignedLead));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, error: () => e.toString()));
    }
  }
}
