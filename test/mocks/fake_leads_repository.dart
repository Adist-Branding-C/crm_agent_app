import 'dart:async';
import 'package:crm_agent_app/bloc/leads/leads_models.dart';
import 'package:crm_agent_app/bloc/enquiry_details/enquiry_details_models.dart';
import 'package:crm_agent_app/data/repositories/activity_repository.dart';
import 'package:crm_agent_app/data/repositories/leads_repository.dart';

/// Fake repository implementation for Leads tests.
class FakeLeadsRepository implements LeadsRepository, ActivityRepository {
  final List<Lead> leads = [];
  final _deletedController = StreamController<String>.broadcast();
  final _updatedController = StreamController<Lead>.broadcast();

  @override
  Future<List<Lead>> getLeads() async => leads;

  @override
  Future<Lead> addLead(Lead lead) async {
    final leadWithId = Lead(
      id: 'mock_id',
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
    leads.add(leadWithId);
    return leadWithId;
  }

  @override
  Future<Lead?> getLeadById(String id) async => null;

  @override
  Future<void> updateLead(Lead lead) async {
    final index = leads.indexWhere((l) => l.id == lead.id);
    if (index != -1) {
      leads[index] = lead;
    }
    _updatedController.add(lead);
  }

  @override
  Future<void> deleteLead(String id) async {
    leads.removeWhere((l) => l.id == id);
    _deletedController.add(id);
  }

  @override
  Stream<String> get leadDeletedStream => _deletedController.stream;

  @override
  Stream<Lead> get leadUpdatedStream => _updatedController.stream;

  @override
  List<EnquiryActivity> getActivitiesForLead(String leadId) => [];

  @override
  void addActivityForLead(String leadId, EnquiryActivity activity) {}

  @override
  void dispose() {
    _deletedController.close();
    _updatedController.close();
  }
}
