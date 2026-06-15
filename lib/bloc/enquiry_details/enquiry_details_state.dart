import 'package:equatable/equatable.dart';
import '../leads/leads_models.dart';
import 'enquiry_details_models.dart';

/// Base state class for Enquiry Details BLoC.
abstract class EnquiryDetailsState extends Equatable {
  const EnquiryDetailsState();

  @override
  List<Object?> get props => [];
}

/// Initial state before loading.
class EnquiryDetailsInitial extends EnquiryDetailsState {}

/// Loading state.
class EnquiryDetailsLoading extends EnquiryDetailsState {}

/// Loaded state containing lead details, activities, and notes.
class EnquiryDetailsLoaded extends EnquiryDetailsState {
  final Lead lead;
  final List<EnquiryActivity> activities;
  final List<EnquiryNote> notes;

  const EnquiryDetailsLoaded({
    required this.lead,
    required this.activities,
    required this.notes,
  });

  /// Copy helper to update parts of the loaded state.
  EnquiryDetailsLoaded copyWith({
    Lead? lead,
    List<EnquiryActivity>? activities,
    List<EnquiryNote>? notes,
  }) {
    return EnquiryDetailsLoaded(
      lead: lead ?? this.lead,
      activities: activities ?? this.activities,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object?> get props => [lead, activities, notes];
}

/// Error state.
class EnquiryDetailsError extends EnquiryDetailsState {
  final String message;
  const EnquiryDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Deleted state signifying successfully deleted lead.
class EnquiryDetailsDeleted extends EnquiryDetailsState {}
