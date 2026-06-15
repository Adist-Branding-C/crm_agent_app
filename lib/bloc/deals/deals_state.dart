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

  /// The sum of all deals in the pipeline.
  double get totalPipelineValue {
    return deals.fold(0.0, (sum, deal) => sum + deal.amount);
  }

  /// The sum of won deals.
  double get wonValue {
    return deals
        .where((d) => d.stage == DealStage.won)
        .fold(0.0, (sum, deal) => sum + deal.amount);
  }

  @override
  List<Object?> get props => [deals];
}

/// State emitted when deals loading fails.
class DealsError extends DealsState {
  final String errorMessage;

  const DealsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
