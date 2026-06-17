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

  Map<DealStage, List<Deal>> get dealsByStage {
    return {for (final stage in DealStage.values) stage: deals.where((d) => d.stage == stage).toList()};
  }

  Map<DealStage, double> get stageTotals {
    return {for (final e in dealsByStage.entries) e.key: e.value.fold(0.0, (s, d) => s + d.amount)};
  }

  @override
  List<Object?> get props => [deals];
}

enum DealsFailure { load, unknown }

/// State emitted when deals loading fails.
class DealsError extends DealsState {
  final DealsFailure failure;

  const DealsError({required this.failure});

  String get errorMessage {
    switch (failure) {
      case DealsFailure.load: return 'Failed to fetch deals';
      case DealsFailure.unknown: return 'An error occurred';
    }
  }

  @override
  List<Object?> get props => [failure];
}
