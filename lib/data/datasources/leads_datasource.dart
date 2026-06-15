import '../../bloc/leads/leads_models.dart';
import '../../bloc/leads/mock_leads.dart';

/// Data source interface for fetching and adding leads.
abstract class LeadsDataSource {
  /// Retrieves all leads.
  Future<List<Lead>> fetchLeads();

  /// Adds a new lead to the store.
  Future<void> insertLead(Lead lead);

  /// Retrieves a single lead by ID.
  Future<Lead?> getLeadById(String id);

  /// Updates an existing lead in the store.
  Future<void> updateLead(Lead lead);

  /// Deletes a lead by ID from the store.
  Future<void> deleteLead(String id);
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

  @override
  Future<Lead?> getLeadById(String id) async {
    try {
      return _leads.firstWhere((lead) => lead.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> updateLead(Lead lead) async {
    final index = _leads.indexWhere((l) => l.id == lead.id);
    if (index != -1) {
      _leads[index] = lead;
    }
  }

  @override
  Future<void> deleteLead(String id) async {
    _leads.removeWhere((l) => l.id == id);
  }
}
