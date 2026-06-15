part of 'add_lead_bloc.dart';

/// Base class for all events of [AddLeadBloc].
abstract class AddLeadEvent extends Equatable {
  const AddLeadEvent();
  @override
  List<Object?> get props => [];
}

class NameChanged extends AddLeadEvent {
  final String name;
  const NameChanged(this.name);
  @override
  List<Object?> get props => [name];
}

class PhoneChanged extends AddLeadEvent {
  final String phone;
  const PhoneChanged(this.phone);
  @override
  List<Object?> get props => [phone];
}

class EmailChanged extends AddLeadEvent {
  final String email;
  const EmailChanged(this.email);
  @override
  List<Object?> get props => [email];
}

class SourceChanged extends AddLeadEvent {
  final LeadSource source;
  const SourceChanged(this.source);
  @override
  List<Object?> get props => [source];
}

class PurposeChanged extends AddLeadEvent {
  final LeadPurpose purpose;
  const PurposeChanged(this.purpose);
  @override
  List<Object?> get props => [purpose];
}

class CategoryChanged extends AddLeadEvent {
  final LeadCategory category;
  const CategoryChanged(this.category);
  @override
  List<Object?> get props => [category];
}

class StatusChanged extends AddLeadEvent {
  final LeadStatus status;
  const StatusChanged(this.status);
  @override
  List<Object?> get props => [status];
}
