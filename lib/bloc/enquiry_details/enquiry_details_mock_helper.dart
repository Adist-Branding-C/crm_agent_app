import '../leads/leads_enums.dart';
import '../leads/leads_models.dart';
import 'enquiry_details_models.dart';

class EnquiryDetailsMockHelper {
  EnquiryDetailsMockHelper._();

  static List<EnquiryActivity> getActivities(String leadName) => [
    const EnquiryActivity(
      id: 'a1',
      title: '@You logged a call with Rahul Menon',
      time: '20 min ago',
      type: EnquiryActivityType.call,
      callStatus: 'Connected',
      duration: '4:12 mins',
      leadStatus: LeadStatus.interested,
      purpose: LeadPurpose.newAdmission,
      remark:
          'The candidate is interested in joining the upcoming batch. Discussed course structure and fee breakdown. They asked to call back on Thursday to confirm payment. Follow-up email sent with brochure.',
      date: 'Today, 22 June 2026',
      timeOfDay: '9:30 AM',
    ),
    const EnquiryActivity(
      id: 'a2',
      title: '@You changed status of Anjali Suresh -> Interested',
      time: '1 hr ago',
      type: EnquiryActivityType.statusChange,
    ),
    EnquiryActivity(
      id: 'a3',
      title: '@You added a note on $leadName',
      time: '2 hr ago',
      type: EnquiryActivityType.note,
    ),
    const EnquiryActivity(
      id: 'a4',
      title: '@You created task for Aravind Krishnan',
      time: '3 hr ago',
      type: EnquiryActivityType.task,
    ),
    const EnquiryActivity(
      id: 'a5',
      title: '@System assigned new lead Divya Ravee...',
      time: 'Yesterday',
      type: EnquiryActivityType.system,
    ),
  ];

  static List<EnquiryNote> getNotes(Lead lead) => [
    EnquiryNote(
      id: 'n1',
      author: '@Arjun',
      content: lead.note ?? 'Comparing with competitor. Needs pricing sheet.',
      time: 'Today, 10:10 AM',
    ),
  ];

  static Lead copyLeadWithStatus(Lead l, LeadStatus s) => Lead(
    id: l.id,
    name: l.name,
    status: s,
    source: l.source,
    category: l.category,
    phone: l.phone,
    location: l.location,
    email: l.email,
    leadSource: l.leadSource,
    nextFollowUp: l.nextFollowUp,
    note: l.note,
  );
}
