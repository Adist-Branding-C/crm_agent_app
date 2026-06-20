import '../../bloc/deals/deals_models.dart';

/// Repository interface managing Deals and pipelines.
abstract class DealsRepository {
  /// Fetches the current user deals list.
  Future<List<Deal>> getDeals();

  /// Adds a new deal to the repository.
  Future<void> addDeal(Deal deal);
}
