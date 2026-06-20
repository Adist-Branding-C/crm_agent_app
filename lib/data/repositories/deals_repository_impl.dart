import '../../bloc/deals/deals_models.dart';
import 'deals_repository.dart';

/// Concrete implementation of [DealsRepository] pre-seeded with mock data.
class DealsRepositoryImpl implements DealsRepository {
  final List<Deal> _deals = [
    const Deal(
      id: '1', title: 'Premium Course', clientName: 'Rahul M.',
      amount: 85000, stage: DealStage.proposal, closeDate: 'Close May 12',
    ),
    const Deal(
      id: '2', title: 'Corporate Batch', clientName: 'Fathima Z.',
      amount: 340000, stage: DealStage.negotiation, closeDate: 'Close May 18',
    ),
    const Deal(
      id: '3', title: 'Full Program', clientName: 'Aravind K.',
      amount: 120000, stage: DealStage.qualified, closeDate: 'Close May 20',
    ),
    const Deal(
      id: '4', title: 'Diploma', clientName: 'Lakshmi W.',
      amount: 65000, stage: DealStage.won, closeDate: 'Close Apr 28',
    ),
    const Deal(
      id: '5', title: 'Crash Course', clientName: 'Anjali S.',
      amount: 45000, stage: DealStage.newStage, closeDate: 'Close May 25',
    ),
    const Deal(
      id: '6', title: 'Weekend Batch', clientName: 'Vishnu P.',
      amount: 38000, stage: DealStage.newStage, closeDate: 'Close May 30',
    ),
    const Deal(
      id: '7', title: 'Annual Plan', clientName: 'Sneha P.',
      amount: 95000, stage: DealStage.qualified, closeDate: 'Close May 15',
    ),
  ];

  @override
  Future<List<Deal>> getDeals() async {
    return List.from(_deals);
  }

  @override
  Future<void> addDeal(Deal deal) async {
    _deals.add(deal);
  }
}
