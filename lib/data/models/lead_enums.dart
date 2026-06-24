enum LeadCategory {
  hot('Hot'),
  warm('Warm'),
  cold('Cold');

  final String label;
  const LeadCategory(this.label);
}

enum LeadStatus {
  newStatus('New'),
  interested('Interested'),
  qualified('Qualified'),
  followUp('Follow Up'),
  notInterested('Not Interested'),
  converted('Converted'),
  lost('Lost');

  final String label;
  const LeadStatus(this.label);
}

enum LeadSource {
  facebook('Facebook'),
  website('Website'),
  referral('Referral'),
  instagram('Instagram'),
  walkIn('Walk-in'),
  googleAds('Google Ads');

  final String label;
  const LeadSource(this.label);
}

enum LeadPurpose {
  enquiry('Enquiry'),
  newAdmission('New Admission'),
  demoRequest('Demo Request');

  final String label;
  const LeadPurpose(this.label);
}

enum SortLeadsBy {
  newest('Newest'),
  oldest('Oldest'),
  alphabetical('A-Z'),
  followUp('Follow-up');

  final String label;
  const SortLeadsBy(this.label);
}
