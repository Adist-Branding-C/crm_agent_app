import '../models/campaign_models.dart';

/// Repository interface managing Marketing Campaigns.
abstract class CampaignsRepository {
  /// Fetches all active and completed campaigns.
  Future<List<Campaign>> getCampaigns();
}
