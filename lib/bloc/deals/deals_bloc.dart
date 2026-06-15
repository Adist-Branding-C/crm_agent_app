import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'deals_models.dart';

part 'deals_event.dart';
part 'deals_state.dart';

/// BLoC managing states and events for Deals.
class DealsBloc extends Bloc<DealsEvent, DealsState> {
  /// Initializes the BLoC.
  DealsBloc() : super(const DealsInitial()) {
    on<LoadDeals>(_onLoadDeals);
  }

  Future<void> _onLoadDeals(LoadDeals event, Emitter<DealsState> emit) async {
    emit(const DealsLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 350));
      emit(DealsLoaded(deals: _mockDeals));
    } catch (e) {
      emit(const DealsError(errorMessage: 'Failed to fetch deals'));
    }
  }

  static const _mockDeals = [
    Deal(
      id: '1',
      title: 'Premium Course',
      clientName: 'Rahul M.',
      amount: 85000,
      stage: DealStage.proposal,
      closeDate: 'Close May 12',
    ),
    Deal(
      id: '2',
      title: 'Corporate Batch',
      clientName: 'Fathima Z.',
      amount: 340000,
      stage: DealStage.negotiation,
      closeDate: 'Close May 18',
    ),
    Deal(
      id: '3',
      title: 'Full Program',
      clientName: 'Aravind K.',
      amount: 120000,
      stage: DealStage.qualified,
      closeDate: 'Close May 20',
    ),
    Deal(
      id: '4',
      title: 'Diploma',
      clientName: 'Lakshmi W.',
      amount: 65000,
      stage: DealStage.won,
      closeDate: 'Close Apr 28',
    ),
    Deal(
      id: '5',
      title: 'Crash Course',
      clientName: 'Anjali S.',
      amount: 45000,
      stage: DealStage.newStage,
      closeDate: 'Close May 25',
    ),
    Deal(
      id: '6',
      title: 'Weekend Batch',
      clientName: 'Vishnu P.',
      amount: 38000,
      stage: DealStage.newStage,
      closeDate: 'Close May 30',
    ),
    Deal(
      id: '7',
      title: 'Annual Plan',
      clientName: 'Sneha P.',
      amount: 95000,
      stage: DealStage.qualified,
      closeDate: 'Close May 15',
    ),
  ];
}
