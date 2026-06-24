import 'lead_enums.dart';
import 'follow_up_models.dart';

final List<FollowUp> mockFollowUps = [
  FollowUp(id: '7', name: 'Vishnu Prasad', category: LeadPurpose.enquiry, status: LeadStatus.followUp, urgency: FollowUpUrgency.overdue),
  FollowUp(id: '1', name: 'Rahul Menon', category: LeadPurpose.newAdmission, status: LeadStatus.interested, urgency: FollowUpUrgency.dueToday),
  FollowUp(id: '2', name: 'Sneha Pillai', category: LeadPurpose.enquiry, status: LeadStatus.followUp, urgency: FollowUpUrgency.dueToday),
  FollowUp(id: '3', name: 'Aravind Krishnan', category: LeadPurpose.newAdmission, status: LeadStatus.qualified, urgency: FollowUpUrgency.dueToday),
  FollowUp(id: '6', name: 'Anjali Suresh', category: LeadPurpose.newAdmission, status: LeadStatus.interested, urgency: FollowUpUrgency.dueToday),
  FollowUp(id: '11', name: 'Lakshmi Warrier', category: LeadPurpose.enquiry, status: LeadStatus.interested, urgency: FollowUpUrgency.dueToday),
  FollowUp(id: '4', name: 'Divya Raveendran', category: LeadPurpose.demoRequest, status: LeadStatus.newStatus, urgency: FollowUpUrgency.upcoming),
  FollowUp(id: '12', name: 'Fathima Zohra', category: LeadPurpose.demoRequest, status: LeadStatus.followUp, urgency: FollowUpUrgency.upcoming),
  FollowUp(id: '13', name: 'Karthik Nambiar', category: LeadPurpose.newAdmission, status: LeadStatus.newStatus, urgency: FollowUpUrgency.upcoming),
];
