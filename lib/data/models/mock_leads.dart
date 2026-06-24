import 'lead_enums.dart';
import 'lead_models.dart';

const List<Lead> mockLeads = [
  Lead(id: '1', name: 'Rahul Menon', status: LeadStatus.interested, source: LeadPurpose.newAdmission, category: LeadCategory.hot, phone: '9876543210', location: 'Kochi', leadSource: LeadSource.facebook),
  Lead(id: '2', name: 'Sneha Pillai', status: LeadStatus.followUp, source: LeadPurpose.enquiry, category: LeadCategory.warm, phone: '9876543211', location: 'Trivandrum', leadSource: LeadSource.website),
  Lead(id: '3', name: 'Aravind Krishnan', status: LeadStatus.qualified, source: LeadPurpose.newAdmission, category: LeadCategory.hot, phone: '9876543212', location: 'Calicut', leadSource: LeadSource.referral),
  Lead(id: '4', name: 'Divya Raveendran', status: LeadStatus.newStatus, source: LeadPurpose.demoRequest, category: LeadCategory.cold, phone: '9876543213', location: 'Kochi', leadSource: LeadSource.instagram),
  Lead(id: '5', name: 'Mohammed Anas', status: LeadStatus.notInterested, source: LeadPurpose.enquiry, category: LeadCategory.cold, phone: '9876543214', location: 'Thrissur', leadSource: LeadSource.walkIn),
  Lead(id: '6', name: 'Anjali Suresh', status: LeadStatus.interested, source: LeadPurpose.newAdmission, category: LeadCategory.warm, phone: '9876543215', location: 'Palakkad', leadSource: LeadSource.facebook),
  Lead(id: '7', name: 'Vishnu Prasad', status: LeadStatus.converted, source: LeadPurpose.demoRequest, category: LeadCategory.hot, phone: '9876543216', location: 'Kottayam', leadSource: LeadSource.website),
  Lead(id: '8', name: 'Priya Nair', status: LeadStatus.qualified, source: LeadPurpose.enquiry, category: LeadCategory.warm, phone: '9876543217', location: 'Kollam', leadSource: LeadSource.referral),
  Lead(id: '9', name: 'Sandeep Kumar', status: LeadStatus.newStatus, source: LeadPurpose.newAdmission, category: LeadCategory.warm, phone: '9876543218', location: 'Kannur', leadSource: LeadSource.instagram),
  Lead(id: '10', name: 'Gautham Krishna', status: LeadStatus.interested, source: LeadPurpose.enquiry, category: LeadCategory.hot, phone: '9876543219', location: 'Alappuzha', leadSource: LeadSource.walkIn),
];
