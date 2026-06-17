import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/bloc/call_log/call_log_bloc.dart';
import 'package:crm_agent_app/bloc/leads/leads_models.dart';
import 'package:crm_agent_app/bloc/leads/leads_enums.dart';
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
  List<EnquiryActivity> getActivitiesForLead(String id) => activities;
  @override
  void addActivityForLead(String id, EnquiryActivity act) => activities.add(act);
}

class MockDialer extends PhoneDialerService {
  String? called;
  @override
  Future<bool> launchDialer(String num) async { called = num; return true; }
}

void main() {
  group('CallLogBloc', () {
    late MockLeadsRepo repo;
    late MockDialer dialer;
    late CallLogBloc bloc;
    final lead = Lead(id: '1', name: 'Rahul', status: LeadStatus.newStatus, source: LeadPurpose.enquiry, category: LeadCategory.hot, phone: '987', location: 'Kochi');

    setUp(() {
      repo = MockLeadsRepo()..leads.add(lead);
      dialer = MockDialer();
      bloc = CallLogBloc(leadsRepository: repo, activityRepository: repo, dialerService: dialer);
    });

    test('Initial state', () => expect(bloc.state, const CallLogInitial()));

    test('InitiateCall state change & dialer', () async {
      expectLater(bloc.stream, emitsInOrder([CallInProgress(lead: lead)]));
      bloc.add(InitiateCall(lead: lead));
      await Future.delayed(const Duration(milliseconds: 10));
      expect(dialer.called, lead.phone);
    });

    test('AppReturnedFromCall navigation', () async {
      bloc.emit(CallInProgress(lead: lead));
      expectLater(bloc.stream, emitsInOrder([CallLogNavigationPending(lead: lead)]));
      bloc.add(const AppReturnedFromCall());
    });

    test('SaveCallLog success', () async {
      expectLater(bloc.stream, emitsInOrder([
        const CallLogSaving(),
        isA<CallLogSaveSuccess>().having((s) => s.lead.status, 'status', LeadStatus.interested),
        const CallLogInitial(),
      ]));
      bloc.add(SaveCallLog(lead: lead, callStatus: 'Connected', leadStatus: LeadStatus.interested, purpose: LeadPurpose.newAdmission, remark: 'ok'));
      await Future.delayed(const Duration(milliseconds: 10));
      expect(repo.leads.first.status, LeadStatus.interested);
    });
  });
}
