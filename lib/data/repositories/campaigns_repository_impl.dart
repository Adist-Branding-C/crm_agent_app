import '../../bloc/campaigns/campaigns_models.dart';
import 'campaigns_repository.dart';

/// Concrete implementation of [CampaignsRepository] pre-seeded with mock data.
class CampaignsRepositoryImpl implements CampaignsRepository {
  @override
  Future<List<Campaign>> getCampaigns() async {
    return const [
      Campaign(
        id: '1',
        title: 'May Admission Drive',
        type: CampaignType.call,
        creator: 'Branch Head',
        doneCount: 52,
        totalCount: 80,
      ),
      Campaign(
        id: '2',
        title: 'Onam Early Bird Offer',
        type: CampaignType.whatsApp,
        creator: 'Marketing',
        doneCount: 31,
        totalCount: 120,
      ),
      Campaign(
        id: '3',
        title: 'Re-engage Cold Leads',
        type: CampaignType.call,
        creator: 'Arjun Nair',
        doneCount: 45,
        totalCount: 45,
      ),
      Campaign(
        id: '4',
        title: 'Demo Follow-up Blast',
        type: CampaignType.email,
        creator: 'Branch Head',
        doneCount: 18,
        totalCount: 60,
      ),
    ];
  }
}
