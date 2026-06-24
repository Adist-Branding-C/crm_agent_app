import 'dart:async';
import '../models/lead_models.dart';
import '../datasources/leads_datasource.dart';
import 'leads_repository.dart';

class LeadsRepositoryImpl implements LeadsRepository {
  final LeadsDataSource leadsDataSource;

  LeadsRepositoryImpl({required this.leadsDataSource});

  final _deletedController = StreamController<String>.broadcast();
  final _updatedController = StreamController<Lead>.broadcast();

  @override
  Stream<String> get leadDeletedStream => _deletedController.stream;

  @override
  Stream<Lead> get leadUpdatedStream => _updatedController.stream;

  @override
  Future<List<Lead>> getLeads() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return leadsDataSource.fetchLeads();
  }

  @override
  Future<Lead> addLead(Lead lead) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final leadWithId = Lead(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: lead.name, status: lead.status, source: lead.source,
      category: lead.category, phone: lead.phone, location: lead.location,
      email: lead.email, leadSource: lead.leadSource,
      nextFollowUp: lead.nextFollowUp, note: lead.note,
    );
    await leadsDataSource.insertLead(leadWithId);
    return leadWithId;
  }

  @override
  Future<Lead?> getLeadById(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final lead = await leadsDataSource.getLeadById(id);
    if (lead == null) _deletedController.add(id);
    return lead;
  }

  @override
  Future<void> updateLead(Lead lead) async {
    await Future.delayed(const Duration(milliseconds: 100));
    await leadsDataSource.updateLead(lead);
    _updatedController.add(lead);
  }

  @override
  Future<void> deleteLead(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    await leadsDataSource.deleteLead(id);
    _deletedController.add(id);
  }

  @override
  void dispose() {
    if (!_deletedController.isClosed) _deletedController.close();
    if (!_updatedController.isClosed) _updatedController.close();
  }
}
