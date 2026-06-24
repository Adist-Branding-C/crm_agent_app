import 'package:crm_agent_app/bloc/leads/leads_models.dart';
import 'package:crm_agent_app/bloc/enquiry_details/enquiry_details_models.dart';
import 'package:crm_agent_app/data/repositories/activity_repository.dart';
import 'package:crm_agent_app/data/repositories/leads_repository.dart';
import 'package:crm_agent_app/utils/phone_dialer_service.dart';

class MockLeadsRepo implements LeadsRepository, ActivityRepository {
  final List<Lead> leads = [];
  final List<EnquiryActivity> activities = [];
  @override
  Future<List<Lead>> getLeads() async => leads;
  @override
  Future<Lead> addLead(Lead l) async => l;
  @override
  Future<Lead?> getLeadById(String id) async => leads.first;
  @override
  Future<void> updateLead(Lead l) async => leads[0] = l;
  @override
  Future<void> deleteLead(String id) async {}
  @override
  Stream<String> get leadDeletedStream => const Stream.empty();
  @override
  Stream<Lead> get leadUpdatedStream => const Stream.empty();
  @override
  List<EnquiryActivity> getActivitiesForLead(String id) => activities;
  @override
  void addActivityForLead(String id, EnquiryActivity act) => activities.add(act);
  @override
  void updateActivityForLead(String id, EnquiryActivity act) {
    final idx = activities.indexWhere((a) => a.id == act.id);
    if (idx != -1) activities[idx] = act;
  }

  @override
  void dispose() {}
}

class MockDialer extends PhoneDialerService {
  String? called;
  @override
  Future<bool> launchDialer(String num) async {
    called = num;
    return true;
  }
}
