import '../../bloc/leads/leads_models.dart';
import '../../bloc/leads/mock_leads.dart';

/// Data source interface for fetching and adding leads.
abstract class LeadsDataSource {
  /// Retrieves all leads.
  Future<List<Lead>> fetchLeads();

  /// Adds a new lead to the store.
  Future<void> insertLead(Lead lead);
}

/// In-memory implementation of [LeadsDataSource] pre-seeded with mock leads.
class LeadsDataSourceImpl implements LeadsDataSource {
  final List<Lead> _leads = List.from(mockLeads);

  @override
  Future<List<Lead>> fetchLeads() async {
    return List.unmodifiable(_leads);
  }

  @override
  Future<void> insertLead(Lead lead) async {
    _leads.insert(0, lead);
  }
}
