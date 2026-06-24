export 'deals_event.dart';
export 'deals_state.dart';
export 'deals_selectors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/deals_repository.dart';
import 'deals_models.dart';

import 'deals_event.dart';
import 'deals_state.dart';

/// BLoC managing states and events for Deals.
class DealsBloc extends Bloc<DealsEvent, DealsState> {
  /// The deals repository.
  final DealsRepository dealsRepository;

  /// Initializes the BLoC.
  DealsBloc({required this.dealsRepository}) : super(const DealsInitial()) {
    on<LoadDeals>(_onLoadDeals);
    on<AddDeal>(_onAddDeal);
  }

  Future<void> _onLoadDeals(LoadDeals event, Emitter<DealsState> emit) async {
    emit(const DealsLoading());
    try {
      final deals = await dealsRepository.getDeals();
      emit(DealsLoaded(deals: deals));
    } catch (e) {
      emit(const DealsError(failure: DealsFailure.load));
    }
  }

  Future<void> _onAddDeal(AddDeal event, Emitter<DealsState> emit) async {
    try {
      final previousState = state;
      await dealsRepository.addDeal(event.deal);
      emit(DealAdded(deal: event.deal));
      if (previousState is DealsLoaded) {
        final updatedList = List<Deal>.from(previousState.deals)..add(event.deal);
        emit(DealsLoaded(deals: updatedList));
      }
    } catch (_) {
      emit(DealAdded(deal: event.deal, error: 'Failed to add deal'));
    }
  }
}
