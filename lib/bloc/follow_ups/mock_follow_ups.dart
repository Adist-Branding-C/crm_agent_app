import '../leads/leads_enums.dart';
import 'follow_ups_models.dart';

/// Static list of mock follow-up call data.
const mockFollowUps = [
  FollowUp(
    id: '1',
    name: 'Vishnu Prasad',
    category: LeadPurpose.enquiry,
    status: LeadStatus.followUp,
    urgency: FollowUpUrgency.overdue,
  ),
  FollowUp(
    id: '2',
    name: 'Rahul Menon',
    category: LeadPurpose.newAdmission,
    status: LeadStatus.interested,
    urgency: FollowUpUrgency.dueToday,
  ),
  FollowUp(
    id: '3',
    name: 'Sneha Pillai',
    category: LeadPurpose.enquiry,
    status: LeadStatus.followUp,
    urgency: FollowUpUrgency.dueToday,
  ),
  FollowUp(
    id: '4',
    name: 'Aravind Krishnan',
    category: LeadPurpose.newAdmission,
    status: LeadStatus.qualified,
    urgency: FollowUpUrgency.dueToday,
  ),
  FollowUp(
    id: '5',
    name: 'Anjali Suresh',
    category: LeadPurpose.newAdmission,
    status: LeadStatus.interested,
    urgency: FollowUpUrgency.dueToday,
  ),
  FollowUp(
    id: '6',
    name: 'Lakshmi Warrier',
    category: LeadPurpose.enquiry,
    status: LeadStatus.interested,
    urgency: FollowUpUrgency.dueToday,
  ),
  FollowUp(
    id: '7',
    name: 'Divya Raveendran',
    category: LeadPurpose.demoRequest,
    status: LeadStatus.newStatus,
    urgency: FollowUpUrgency.upcoming,
  ),
  FollowUp(
    id: '8',
    name: 'Fathima Zohra',
    category: LeadPurpose.demoRequest,
    status: LeadStatus.qualified,
    urgency: FollowUpUrgency.upcoming,
  ),
  FollowUp(
    id: '9',
    name: 'Karthik Nambiar',
    category: LeadPurpose.newAdmission,
    status: LeadStatus.newStatus,
    urgency: FollowUpUrgency.upcoming,
  ),
];
