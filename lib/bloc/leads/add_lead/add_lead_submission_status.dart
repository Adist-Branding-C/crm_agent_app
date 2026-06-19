import 'package:equatable/equatable.dart';
import '../leads_models.dart';

class AddLeadSubmissionStatus extends Equatable {
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;
  final Lead? lead;

  const AddLeadSubmissionStatus({
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
    this.lead,
  });

  AddLeadSubmissionStatus copyWith({
    bool? isSubmitting,
    bool? isSuccess,
    String? Function()? error,
    Lead? lead,
  }) {
    return AddLeadSubmissionStatus(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error != null ? error() : this.error,
      lead: lead ?? this.lead,
    );
  }

  @override
  List<Object?> get props => [isSubmitting, isSuccess, error, lead];
}
