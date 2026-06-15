part of 'add_lead_bloc.dart';

/// Base class for all events of [AddLeadBloc].
abstract class AddLeadEvent extends Equatable {
  const AddLeadEvent();

  @override
  List<Object?> get props => [];
}

/// Event dispatched when the name input changes.
class NameChanged extends AddLeadEvent {
  /// The new name input value.
  final String name;

  /// Creates a constant [NameChanged].
  const NameChanged(this.name);
  @override
  List<Object?> get props => [name];
}

/// Event dispatched when the phone input changes.
class PhoneChanged extends AddLeadEvent {
  /// The new phone input value.
  final String phone;

  /// Creates a constant [PhoneChanged].
  const PhoneChanged(this.phone);
  @override
  List<Object?> get props => [phone];
}

/// Event dispatched when the email input changes.
class EmailChanged extends AddLeadEvent {
  /// The new email input value.
  final String email;

  /// Creates a constant [EmailChanged].
  const EmailChanged(this.email);
  @override
  List<Object?> get props => [email];
}

/// Event dispatched to submit the Add Lead form.
class SubmitForm extends AddLeadEvent {
  final String name, phone, email, location;
  final String source, purpose, category, status;
  final String? nextFollowUp, note;

  /// Creates a constant [SubmitForm] event.
  const SubmitForm({
    required this.name,
    required this.phone,
    required this.email,
    required this.location,
    required this.source,
    required this.purpose,
    required this.category,
    required this.status,
    this.nextFollowUp,
    this.note,
  });

  @override
  List<Object?> get props => [
    name,
    phone,
    email,
    location,
    source,
    purpose,
    category,
    status,
    nextFollowUp,
    note,
  ];
}
