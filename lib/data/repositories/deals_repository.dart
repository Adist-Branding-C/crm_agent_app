import '../../bloc/deals/deals_models.dart';

/// Repository interface managing Deals and pipelines.
abstract class DealsRepository {
  /// Fetches the current user deals list.
  Future<List<Deal>> getDeals();
}

/// Concrete implementation of [DealsRepository] pre-seeded with mock data.
class DealsRepositoryImpl implements DealsRepository {
  @override
  Future<List<Deal>> getDeals() async {
    return const [
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
}
