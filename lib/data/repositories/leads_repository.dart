import '../../bloc/leads/leads_models.dart';
import '../datasources/leads_datasource.dart';

/// Repository interface managing leads business operations.
abstract class LeadsRepository {
  /// Fetches the current list of leads.
  Future<List<Lead>> getLeads();

  /// Adds a new lead.
  Future<void> addLead(Lead lead);
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
  Future<void> addLead(Lead lead) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    await leadsDataSource.insertLead(lead);
  }
}
