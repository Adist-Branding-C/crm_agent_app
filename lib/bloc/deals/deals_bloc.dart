import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/deals_repository.dart';
import 'deals_models.dart';

part 'deals_event.dart';
part 'deals_state.dart';

/// BLoC managing states and events for Deals.
class DealsBloc extends Bloc<DealsEvent, DealsState> {
  /// The deals repository.
  final DealsRepository dealsRepository;

  /// Initializes the BLoC.
  DealsBloc({required this.dealsRepository}) : super(const DealsInitial()) {
    on<LoadDeals>(_onLoadDeals);
  }

  Future<void> _onLoadDeals(LoadDeals event, Emitter<DealsState> emit) async {
    emit(const DealsLoading());
    try {
      final deals = await dealsRepository.getDeals();
      emit(DealsLoaded(deals: deals));
    } catch (e) {
      emit(const DealsError(errorMessage: 'Failed to fetch deals'));
    }
  }
}
