part of 'add_lead_bloc.dart';

/// Represents the state of the Add Lead form and submission status.
class AddLeadState extends Equatable {
  /// The current value of the name field.
  final String name;

  /// The current value of the phone field.
  final String phone;

  /// The current value of the email field.
  final String email;

  /// Error message for name, null if valid.
  final String? nameError;

  /// Error message for phone, null if valid.
  final String? phoneError;

  /// Error message for email, null if valid.
  final String? emailError;

  /// True if currently submitting to fake API.
  final bool isSubmitting;

  /// True if successfully saved.
  final bool isSuccess;

  /// General API submission error if any.
  final String? error;

  /// The created lead object.
  final Lead? lead;

  /// Creates a constant [AddLeadState].
  const AddLeadState({
    this.name = '',
    this.phone = '',
    this.email = '',
    this.nameError,
    this.phoneError,
    this.emailError,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
    this.lead,
  });

  /// True if all validated fields have no errors and are not empty.
  bool get isValid =>
      nameError == null &&
      phoneError == null &&
      emailError == null &&
      name.isNotEmpty &&
      phone.isNotEmpty &&
      email.isNotEmpty;

  /// Creates a copy of [AddLeadState] with overridden properties.
  AddLeadState copyWith({
    String? name,
    String? phone,
    String? email,
    String? Function()? nameError,
    String? Function()? phoneError,
    String? Function()? emailError,
    bool? isSubmitting,
    bool? isSuccess,
    String? Function()? error,
    Lead? lead,
  }) {
    return AddLeadState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      nameError: nameError != null ? nameError() : this.nameError,
      phoneError: phoneError != null ? phoneError() : this.phoneError,
      emailError: emailError != null ? emailError() : this.emailError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error != null ? error() : this.error,
      lead: lead ?? this.lead,
    );
  }

  @override
  List<Object?> get props => [
    name,
    phone,
    email,
    nameError,
    phoneError,
    emailError,
    isSubmitting,
    isSuccess,
    error,
    lead,
  ];
}
