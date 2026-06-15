import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../leads_models.dart';

part 'add_lead_event.dart';
part 'add_lead_state.dart';

/// BLoC managing the state transitions and form validation of the Add Lead form.
class AddLeadBloc extends Bloc<AddLeadEvent, AddLeadState> {
  /// Initializes the BLoC with [AddLeadState].
  AddLeadBloc() : super(const AddLeadState()) {
    on<NameChanged>(_onNameChanged);
    on<PhoneChanged>(_onPhoneChanged);
    on<EmailChanged>(_onEmailChanged);
    on<SubmitForm>(_onSubmitForm);
  }

  void _onNameChanged(NameChanged event, Emitter<AddLeadState> emit) {
    final name = event.name;
    String? err;
    if (name.trim().isEmpty) {
      err = 'Name is required.';
    } else if (name.length < 3 || !RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
      err = 'Please enter a valid name (alphabets only, minimum 3 characters).';
    }
    emit(state.copyWith(name: name, nameError: () => err));
  }

  void _onPhoneChanged(PhoneChanged event, Emitter<AddLeadState> emit) {
    final phone = event.phone;
    String? err;
    if (phone.trim().isEmpty) {
      err = 'Phone number is required.';
    } else if (!RegExp(r'^\d{10}$').hasMatch(phone)) {
      err = 'Please enter a valid 10-digit phone number.';
    }
    emit(state.copyWith(phone: phone, phoneError: () => err));
  }

  void _onEmailChanged(EmailChanged event, Emitter<AddLeadState> emit) {
    final email = event.email;
    String? err;
    if (email.trim().isEmpty) {
      err = 'Email address is required.';
    } else if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email)) {
      err = 'Please enter a valid email address (e.g., example@domain.com).';
    }
    emit(state.copyWith(email: email, emailError: () => err));
  }

  Future<void> _onSubmitForm(
    SubmitForm event,
    Emitter<AddLeadState> emit,
  ) async {
    if (!state.isValid) return;
    emit(
      state.copyWith(isSubmitting: true, isSuccess: false, error: () => null),
    );
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final lead = Lead(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: event.name.trim(),
        phone: event.phone.trim(),
        email: event.email.trim(),
        location: event.location.trim(),
        source: event.purpose,
        category: event.category,
        status: event.status,
        leadSource: event.source,
        nextFollowUp: event.nextFollowUp,
        note: event.note,
      );
      emit(state.copyWith(isSubmitting: false, isSuccess: true, lead: lead));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, error: () => e.toString()));
    }
  }
}
