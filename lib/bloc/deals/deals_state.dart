part of 'deals_bloc.dart';

/// Base class for all states of the Deals BLoC.
abstract class DealsState extends Equatable {
  const DealsState();

  @override
  List<Object?> get props => [];
}

/// Initial state of the deals screen.
class DealsInitial extends DealsState {
  const DealsInitial();
}

/// State emitted while deals are loading.
class DealsLoading extends DealsState {
  const DealsLoading();
}

/// State emitted when deals are loaded successfully.
class DealsLoaded extends DealsState {
  final List<Deal> deals;

  const DealsLoaded({required this.deals});

  @override
  List<Object?> get props => [deals];
}

/// State emitted when a deal is added (success or failure).
class DealAdded extends DealsState {
  final Deal deal;
  final String? error;

  const DealAdded({required this.deal, this.error});

  @override
  List<Object?> get props => [deal, error];
}

enum DealsFailure { load, unknown }

/// State emitted when deals loading fails.
class DealsError extends DealsState {
  final DealsFailure failure;

  const DealsError({required this.failure});

  @override
  List<Object?> get props => [failure];
}
