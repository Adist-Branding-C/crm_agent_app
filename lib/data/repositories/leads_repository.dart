import '../../bloc/leads/leads_models.dart';

/// Repository interface managing leads CRUD operations.
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

  /// Stream of deleted lead IDs to notify subscribers.
  Stream<String> get leadDeletedStream;

  /// Stream of updated leads to notify subscribers.
  Stream<Lead> get leadUpdatedStream;

  /// Closes internal stream controllers.
  /// Safe to call when the repository is no longer needed.
  void dispose();
}
