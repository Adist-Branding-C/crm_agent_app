import 'package:equatable/equatable.dart';
import '../leads/leads_models.dart';
import '../leads/leads_enums.dart';

/// Types of activities that can occur for a lead enquiry.
enum EnquiryActivityType { call, statusChange, note, task, system }

/// Represents an activity timeline event on the Lead Detail page.
class EnquiryActivity extends Equatable {
  final String id;
  final String title;
  final String time;
  final EnquiryActivityType type;

  const EnquiryActivity({
    required this.id,
    required this.title,
    required this.time,
    required this.type,
  });

  @override
  List<Object?> get props => [id, title, time, type];
}

/// Represents a note added to the lead.
class EnquiryNote extends Equatable {
  final String id;
  final String author;
  final String content;
  final String time;

  const EnquiryNote({
    required this.id,
    required this.author,
    required this.content,
    required this.time,
  });

  @override
  List<Object?> get props => [id, author, content, time];
}

/// Helper utilities for mock details data.
class EnquiryDetailsMockHelper {
  EnquiryDetailsMockHelper._();

  static List<EnquiryActivity> getActivities(String leadName) => [
    const EnquiryActivity(id: 'a1', title: '@You logged a call with Rahul Menon', time: '20 min ago', type: EnquiryActivityType.call),
    const EnquiryActivity(id: 'a2', title: '@You changed status of Anjali Suresh -> Interested', time: '1 hr ago', type: EnquiryActivityType.statusChange),
    EnquiryActivity(id: 'a3', title: '@You added a note on $leadName', time: '2 hr ago', type: EnquiryActivityType.note),
    const EnquiryActivity(id: 'a4', title: '@You created task for Aravind Krishnan', time: '3 hr ago', type: EnquiryActivityType.task),
    const EnquiryActivity(id: 'a5', title: '@System assigned new lead Divya Ravee...', time: 'Yesterday', type: EnquiryActivityType.system),
  ];

  static List<EnquiryNote> getNotes(Lead lead) => [
    EnquiryNote(id: 'n1', author: '@Arjun', content: lead.note ?? 'Comparing with competitor. Needs pricing sheet.', time: 'Today, 10:10 AM'),
  ];

  static Lead copyLeadWithStatus(Lead l, LeadStatus s) => Lead(
    id: l.id, name: l.name, status: s,
    source: l.source, category: l.category,
    phone: l.phone, location: l.location,
    email: l.email, leadSource: l.leadSource,
    nextFollowUp: l.nextFollowUp, note: l.note,
  );
}
