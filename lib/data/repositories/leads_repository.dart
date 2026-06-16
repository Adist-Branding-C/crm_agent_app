import '../../bloc/leads/leads_models.dart';
import '../datasources/leads_datasource.dart';

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

/// Concrete implementation of [LeadsRepository] interacting with [LeadsDataSource].
class LeadsRepositoryImpl implements LeadsRepository {
  /// Creates a [LeadsRepositoryImpl] with the given [leadsDataSource].
  LeadsRepositoryImpl({required this.leadsDataSource});

  /// The data source used to manage leads data.
  final LeadsDataSource leadsDataSource;

  @override
  Future<List<Lead>> getLeads() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 200));
    return leadsDataSource.fetchLeads();
  }

  @override
  Future<Lead> addLead(Lead lead) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    final leadWithId = Lead(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: lead.name,
      status: lead.status,
      source: lead.source,
      category: lead.category,
      phone: lead.phone,
      location: lead.location,
      email: lead.email,
      leadSource: lead.leadSource,
      nextFollowUp: lead.nextFollowUp,
      note: lead.note,
    );
    await leadsDataSource.insertLead(leadWithId);
    return leadWithId;
  }

  @override
  Future<Lead?> getLeadById(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return leadsDataSource.getLeadById(id);
  }

  @override
  Future<void> updateLead(Lead lead) async {
    await Future.delayed(const Duration(milliseconds: 100));
    await leadsDataSource.updateLead(lead);
  }

  @override
  Future<void> deleteLead(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    await leadsDataSource.deleteLead(id);
  }
}
