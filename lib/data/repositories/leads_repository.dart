import '../../bloc/leads/leads_models.dart';

/// Repository interface managing leads business operations.
abstract class LeadsRepository {
  /// Fetches the current list of leads.
  Future<List<Lead>> getLeads();

  /// Adds a new lead.
  Future<Lead> addLead(Lead lead);

  /// Retrieves a single lead by ID.
  Future<Lead?> getLeadById(String id);

  /// Updates an existing lead.
  Future<void> updateLead(Lead lead);

  /// Deletes a lead by ID.
  Future<void> deleteLead(String id);
}
