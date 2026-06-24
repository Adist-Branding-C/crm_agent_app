import '../models/lead_models.dart';
import '../models/mock_leads.dart';
import '../models/mock_follow_ups.dart';
import '../models/lead_enums.dart';

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
      try {
        final f = mockFollowUps.firstWhere((followUp) => followUp.id == id);
        return Lead(
          id: f.id,
          name: f.name,
          status: f.status,
          source: f.category,
          category: LeadCategory.warm,
          phone: '9876543210',
          location: 'Kochi',
          leadSource: LeadSource.website,
        );
      } catch (_) {
        return null;
      }
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
