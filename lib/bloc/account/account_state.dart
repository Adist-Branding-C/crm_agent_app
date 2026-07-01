import 'package:equatable/equatable.dart';
import 'account_models.dart';

/// Base class for all Account states.
abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object?> get props => [];
}

/// Initial state.
class AccountInitial extends AccountState {
  const AccountInitial();
}

/// Loading state.
class AccountLoading extends AccountState {
  const AccountLoading();
}

/// Status of the loaded account state.
enum AccountStatus { loaded, updating, updateSuccess, updateFailure }

/// State containing successfully loaded profile details and update status.
class AccountLoaded extends AccountState {
  final AccountProfile profile;
  final AccountStatus status;
  final String? errorMessage;

  const AccountLoaded({
    required this.profile,
    this.status = AccountStatus.loaded,
    this.errorMessage,
  });

  /// Copy constructor.
  AccountLoaded copyWith({
    AccountProfile? profile,
    AccountStatus? status,
    String? Function()? errorMessage,
  }) => AccountLoaded(
    profile: profile ?? this.profile,
    status: status ?? this.status,
    errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
  );

  @override
  List<Object?> get props => [profile, status, errorMessage];
}

enum AccountFailure { loadProfile, logout, unknown }

/// Error state.
class AccountError extends AccountState {
  final AccountFailure failure;

  const AccountError({required this.failure});

  @override
  List<Object?> get props => [failure];
}

/// State representing a successful logout transition.
class AccountLoggedOut extends AccountState {
  const AccountLoggedOut();
}
