import 'package:equatable/equatable.dart';
import 'deals_models.dart';

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

/// Event triggered to add a new deal.
class AddDeal extends DealsEvent {
  final Deal deal;
  const AddDeal(this.deal);

  @override
  List<Object?> get props => [deal];
}
