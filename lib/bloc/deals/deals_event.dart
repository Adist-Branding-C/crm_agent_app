part of 'deals_bloc.dart';

/// Base class for all Deals BLoC events.
abstract class DealsEvent extends Equatable {
  const DealsEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered to load/fetch deals list.
class LoadDeals extends DealsEvent {
  const LoadDeals();
}
